import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/src/core/errors/exceptions/data_layer_exception.dart';
import 'package:flutter_template/src/core/service/network_service/network_service.dart';
import 'package:logging/logging.dart';

import '../core/errors/export.dart';
import 'base_model.dart';

abstract class BaseRepository {
  final NetworkService _network;
  Logger get _logger => Logger('$runtimeType');

  BaseRepository(this._network);

  Future<Either<FailureType, TDomain>> get<TModel extends BaseModel<TDomain>, TDomain>({
    required FutureOr<TModel?> Function() localGet,
    bool Function(TModel)? isLocalModelValid,
    required FutureOr<void> Function(TModel) localSet,
    required Future<TModel> Function() remoteGet,
    bool force = false,
    List<DataLayerExceptionCode> expectedErrors = const [],
  }) async {
    try {
      if (!force) _logger.fine('Requesting local $TModel');
      TModel? model = force ? null : await localGet();
      if (model == null || !(isLocalModelValid?.call(model) ?? false)) {
        if (!(await _network.hasConnection)) return const Left(FailureType.noInternet);

        _logger.fine('Requesting remote $TModel');
        model = await remoteGet();
        _logger.fine('Setting local $model');
        await localSet(model);
      }
      return Right(model.toDomain());
    } on Exception catch (e) {
      bool ignoreError = e is ApiException && expectedErrors.contains(e.code);
      if (!ignoreError) {
        FirebaseCrashlytics.instance.recordError(
          'Failed requesting $TDomain',
          StackTrace.current,
          reason: e,
        );
        _logger.warning('Error occured while getting $TDomain', e);
      }
      return Left(FailureTypeExtension.fromException(e));
    }
  }

  Future<Either<FailureType, List<TDomain>>> getList<TModel extends BaseModel<TDomain>, TDomain>({
    required FutureOr<List<TModel>> Function() localGet,
    bool Function(List<TModel>)? isLocalModelValid,
    required FutureOr<void> Function(List<TModel>) localSet,
    required Future<List<TModel>> Function() remoteGet,
    bool force = false,
    List<DataLayerExceptionCode> expectedErrors = const [],
  }) async {
    try {
      if (!force) _logger.fine('Requesting local List<$TModel>');
      List<TModel> model = force ? [] : await localGet();
      if (model.isEmpty || !(isLocalModelValid?.call(model) ?? false)) {
        if (!(await _network.hasConnection)) return const Left(FailureType.noInternet);

        _logger.fine('Requesting remote List<$TModel>');
        model = await remoteGet();
        _logger.fine('Adding local ${model.length} new entries for List<$TModel>');
        await localSet(model);
      }
      return Right(model.map((e) => e.toDomain()).toList());
    } on Exception catch (e) {
      bool ignoreError = e is ApiException && expectedErrors.contains(e.code);
      if (!ignoreError) {
        FirebaseCrashlytics.instance.recordError(
          'Failed requesting List<$TDomain>',
          StackTrace.current,
          reason: e,
        );
        _logger.warning('Error occured while getting List<$TDomain>', e);
      }
      return Left(FailureTypeExtension.fromException(e));
    }
  }

  Future<Either<FailureType, void>> callRemote({
    required Future<void> Function() remoteAction,
  }) async {
    try {
      _logger.fine('Executing action on remote');
      await remoteAction();
      return const Right(null);
    } on Exception catch (e) {
      return Left(await recordError(StackTrace.current, e, 'Error occurred while executing action on remote'));
    }
  }

  Future<Either<FailureType, void>> update({
    required Future<void> Function() remoteAction,
    required void Function() localUpdate,
    void Function()? notifyListeners,
  }) async {
    try {
      _logger.fine('Executing update action');
      if (!(await _network.hasConnection)) return const Left(FailureType.noInternet);
      await remoteAction();
      localUpdate();
      notifyListeners?.call();
      return const Right(null);
    } on Exception catch (e) {
      return Left(await recordError(StackTrace.current, e, 'Error occurred while executing update action'));
    }
  }

  Future<FailureType> recordError(StackTrace stackTrace, Exception e, String errorMessage) async {
    if (!kDebugMode) {
      await FirebaseCrashlytics.instance.recordError(
        errorMessage,
        StackTrace.current,
        reason: e,
      );
    }
    _logger.warning(errorMessage, e);
    return FailureTypeExtension.fromException(e);
  }
}
