// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppStateState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() ready,
    required TResult Function() loading,
    required TResult Function(
            InfoFeedback info, Map<String, dynamic>? namedArgs)
        info,
    required TResult Function(
            ErrorFeedback? error,
            Map<String, dynamic>? namedArgs,
            FutureOr<void> Function()? onConfirm)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? ready,
    TResult? Function()? loading,
    TResult? Function(InfoFeedback info, Map<String, dynamic>? namedArgs)? info,
    TResult? Function(ErrorFeedback? error, Map<String, dynamic>? namedArgs,
            FutureOr<void> Function()? onConfirm)?
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? ready,
    TResult Function()? loading,
    TResult Function(InfoFeedback info, Map<String, dynamic>? namedArgs)? info,
    TResult Function(ErrorFeedback? error, Map<String, dynamic>? namedArgs,
            FutureOr<void> Function()? onConfirm)?
        error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Ready value) ready,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Info value) info,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Ready value)? ready,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Info value)? info,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Ready value)? ready,
    TResult Function(_Loading value)? loading,
    TResult Function(_Info value)? info,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateStateCopyWith<$Res> {
  factory $AppStateStateCopyWith(
          AppStateState value, $Res Function(AppStateState) then) =
      _$AppStateStateCopyWithImpl<$Res, AppStateState>;
}

/// @nodoc
class _$AppStateStateCopyWithImpl<$Res, $Val extends AppStateState>
    implements $AppStateStateCopyWith<$Res> {
  _$AppStateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ReadyCopyWith<$Res> {
  factory _$$_ReadyCopyWith(_$_Ready value, $Res Function(_$_Ready) then) =
      __$$_ReadyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ReadyCopyWithImpl<$Res>
    extends _$AppStateStateCopyWithImpl<$Res, _$_Ready>
    implements _$$_ReadyCopyWith<$Res> {
  __$$_ReadyCopyWithImpl(_$_Ready _value, $Res Function(_$_Ready) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Ready implements _Ready {
  const _$_Ready();

  @override
  String toString() {
    return 'AppStateState.ready()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Ready);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() ready,
    required TResult Function() loading,
    required TResult Function(
            InfoFeedback info, Map<String, dynamic>? namedArgs)
        info,
    required TResult Function(
            ErrorFeedback? error,
            Map<String, dynamic>? namedArgs,
            FutureOr<void> Function()? onConfirm)
        error,
  }) {
    return ready();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? ready,
    TResult? Function()? loading,
    TResult? Function(InfoFeedback info, Map<String, dynamic>? namedArgs)? info,
    TResult? Function(ErrorFeedback? error, Map<String, dynamic>? namedArgs,
            FutureOr<void> Function()? onConfirm)?
        error,
  }) {
    return ready?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? ready,
    TResult Function()? loading,
    TResult Function(InfoFeedback info, Map<String, dynamic>? namedArgs)? info,
    TResult Function(ErrorFeedback? error, Map<String, dynamic>? namedArgs,
            FutureOr<void> Function()? onConfirm)?
        error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Ready value) ready,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Info value) info,
    required TResult Function(_Error value) error,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Ready value)? ready,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Info value)? info,
    TResult? Function(_Error value)? error,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Ready value)? ready,
    TResult Function(_Loading value)? loading,
    TResult Function(_Info value)? info,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class _Ready implements AppStateState {
  const factory _Ready() = _$_Ready;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$AppStateStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'AppStateState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() ready,
    required TResult Function() loading,
    required TResult Function(
            InfoFeedback info, Map<String, dynamic>? namedArgs)
        info,
    required TResult Function(
            ErrorFeedback? error,
            Map<String, dynamic>? namedArgs,
            FutureOr<void> Function()? onConfirm)
        error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? ready,
    TResult? Function()? loading,
    TResult? Function(InfoFeedback info, Map<String, dynamic>? namedArgs)? info,
    TResult? Function(ErrorFeedback? error, Map<String, dynamic>? namedArgs,
            FutureOr<void> Function()? onConfirm)?
        error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? ready,
    TResult Function()? loading,
    TResult Function(InfoFeedback info, Map<String, dynamic>? namedArgs)? info,
    TResult Function(ErrorFeedback? error, Map<String, dynamic>? namedArgs,
            FutureOr<void> Function()? onConfirm)?
        error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Ready value) ready,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Info value) info,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Ready value)? ready,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Info value)? info,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Ready value)? ready,
    TResult Function(_Loading value)? loading,
    TResult Function(_Info value)? info,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AppStateState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_InfoCopyWith<$Res> {
  factory _$$_InfoCopyWith(_$_Info value, $Res Function(_$_Info) then) =
      __$$_InfoCopyWithImpl<$Res>;
  @useResult
  $Res call({InfoFeedback info, Map<String, dynamic>? namedArgs});
}

/// @nodoc
class __$$_InfoCopyWithImpl<$Res>
    extends _$AppStateStateCopyWithImpl<$Res, _$_Info>
    implements _$$_InfoCopyWith<$Res> {
  __$$_InfoCopyWithImpl(_$_Info _value, $Res Function(_$_Info) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? namedArgs = freezed,
  }) {
    return _then(_$_Info(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as InfoFeedback,
      namedArgs: freezed == namedArgs
          ? _value._namedArgs
          : namedArgs // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

class _$_Info implements _Info {
  const _$_Info({required this.info, final Map<String, dynamic>? namedArgs})
      : _namedArgs = namedArgs;

  @override
  final InfoFeedback info;
  final Map<String, dynamic>? _namedArgs;
  @override
  Map<String, dynamic>? get namedArgs {
    final value = _namedArgs;
    if (value == null) return null;
    if (_namedArgs is EqualUnmodifiableMapView) return _namedArgs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'AppStateState.info(info: $info, namedArgs: $namedArgs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Info &&
            (identical(other.info, info) || other.info == info) &&
            const DeepCollectionEquality()
                .equals(other._namedArgs, _namedArgs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, info, const DeepCollectionEquality().hash(_namedArgs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InfoCopyWith<_$_Info> get copyWith =>
      __$$_InfoCopyWithImpl<_$_Info>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() ready,
    required TResult Function() loading,
    required TResult Function(
            InfoFeedback info, Map<String, dynamic>? namedArgs)
        info,
    required TResult Function(
            ErrorFeedback? error,
            Map<String, dynamic>? namedArgs,
            FutureOr<void> Function()? onConfirm)
        error,
  }) {
    return info(this.info, namedArgs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? ready,
    TResult? Function()? loading,
    TResult? Function(InfoFeedback info, Map<String, dynamic>? namedArgs)? info,
    TResult? Function(ErrorFeedback? error, Map<String, dynamic>? namedArgs,
            FutureOr<void> Function()? onConfirm)?
        error,
  }) {
    return info?.call(this.info, namedArgs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? ready,
    TResult Function()? loading,
    TResult Function(InfoFeedback info, Map<String, dynamic>? namedArgs)? info,
    TResult Function(ErrorFeedback? error, Map<String, dynamic>? namedArgs,
            FutureOr<void> Function()? onConfirm)?
        error,
    required TResult orElse(),
  }) {
    if (info != null) {
      return info(this.info, namedArgs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Ready value) ready,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Info value) info,
    required TResult Function(_Error value) error,
  }) {
    return info(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Ready value)? ready,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Info value)? info,
    TResult? Function(_Error value)? error,
  }) {
    return info?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Ready value)? ready,
    TResult Function(_Loading value)? loading,
    TResult Function(_Info value)? info,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (info != null) {
      return info(this);
    }
    return orElse();
  }
}

abstract class _Info implements AppStateState {
  const factory _Info(
      {required final InfoFeedback info,
      final Map<String, dynamic>? namedArgs}) = _$_Info;

  InfoFeedback get info;
  Map<String, dynamic>? get namedArgs;
  @JsonKey(ignore: true)
  _$$_InfoCopyWith<_$_Info> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {ErrorFeedback? error,
      Map<String, dynamic>? namedArgs,
      FutureOr<void> Function()? onConfirm});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$AppStateStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? namedArgs = freezed,
    Object? onConfirm = freezed,
  }) {
    return _then(_$_Error(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorFeedback?,
      namedArgs: freezed == namedArgs
          ? _value._namedArgs
          : namedArgs // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      onConfirm: freezed == onConfirm
          ? _value.onConfirm
          : onConfirm // ignore: cast_nullable_to_non_nullable
              as FutureOr<void> Function()?,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(
      {this.error, final Map<String, dynamic>? namedArgs, this.onConfirm})
      : _namedArgs = namedArgs;

  @override
  final ErrorFeedback? error;
  final Map<String, dynamic>? _namedArgs;
  @override
  Map<String, dynamic>? get namedArgs {
    final value = _namedArgs;
    if (value == null) return null;
    if (_namedArgs is EqualUnmodifiableMapView) return _namedArgs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final FutureOr<void> Function()? onConfirm;

  @override
  String toString() {
    return 'AppStateState.error(error: $error, namedArgs: $namedArgs, onConfirm: $onConfirm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality()
                .equals(other._namedArgs, _namedArgs) &&
            (identical(other.onConfirm, onConfirm) ||
                other.onConfirm == onConfirm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error,
      const DeepCollectionEquality().hash(_namedArgs), onConfirm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() ready,
    required TResult Function() loading,
    required TResult Function(
            InfoFeedback info, Map<String, dynamic>? namedArgs)
        info,
    required TResult Function(
            ErrorFeedback? error,
            Map<String, dynamic>? namedArgs,
            FutureOr<void> Function()? onConfirm)
        error,
  }) {
    return error(this.error, namedArgs, onConfirm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? ready,
    TResult? Function()? loading,
    TResult? Function(InfoFeedback info, Map<String, dynamic>? namedArgs)? info,
    TResult? Function(ErrorFeedback? error, Map<String, dynamic>? namedArgs,
            FutureOr<void> Function()? onConfirm)?
        error,
  }) {
    return error?.call(this.error, namedArgs, onConfirm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? ready,
    TResult Function()? loading,
    TResult Function(InfoFeedback info, Map<String, dynamic>? namedArgs)? info,
    TResult Function(ErrorFeedback? error, Map<String, dynamic>? namedArgs,
            FutureOr<void> Function()? onConfirm)?
        error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, namedArgs, onConfirm);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Ready value) ready,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Info value) info,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Ready value)? ready,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Info value)? info,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Ready value)? ready,
    TResult Function(_Loading value)? loading,
    TResult Function(_Info value)? info,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements AppStateState {
  const factory _Error(
      {final ErrorFeedback? error,
      final Map<String, dynamic>? namedArgs,
      final FutureOr<void> Function()? onConfirm}) = _$_Error;

  ErrorFeedback? get error;
  Map<String, dynamic>? get namedArgs;
  FutureOr<void> Function()? get onConfirm;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
