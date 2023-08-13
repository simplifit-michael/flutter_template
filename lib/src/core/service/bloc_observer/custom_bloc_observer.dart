// ignore_for_file: cascade_invocations

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

class CustomBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    final logger = Logger(bloc.runtimeType.toString());
    logger.info('Change: $change');
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    final logger = Logger(bloc.runtimeType.toString());
    logger.warning('Error:', error);

    super.onError(bloc, error, stackTrace);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    final logger = Logger(bloc.runtimeType.toString());
    logger.info('Event: $event');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    final logger = Logger(bloc.runtimeType.toString());
    logger.info('Transition: $transition');
    super.onTransition(bloc, transition);
  }
}
