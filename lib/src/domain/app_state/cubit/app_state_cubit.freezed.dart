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
    required TResult Function(LoadingReason? reason) loading,
    required TResult Function(ErrorReason? reason, VoidCallback? onConfirm)
        error,
    required TResult Function(InfoReason reason, VoidCallback? onConfirm) info,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? ready,
    TResult? Function(LoadingReason? reason)? loading,
    TResult? Function(ErrorReason? reason, VoidCallback? onConfirm)? error,
    TResult? Function(InfoReason reason, VoidCallback? onConfirm)? info,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? ready,
    TResult Function(LoadingReason? reason)? loading,
    TResult Function(ErrorReason? reason, VoidCallback? onConfirm)? error,
    TResult Function(InfoReason reason, VoidCallback? onConfirm)? info,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppReadyState value) ready,
    required TResult Function(_AppLoadingState value) loading,
    required TResult Function(_AppErrorState value) error,
    required TResult Function(_AppInfoState value) info,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AppReadyState value)? ready,
    TResult? Function(_AppLoadingState value)? loading,
    TResult? Function(_AppErrorState value)? error,
    TResult? Function(_AppInfoState value)? info,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppReadyState value)? ready,
    TResult Function(_AppLoadingState value)? loading,
    TResult Function(_AppErrorState value)? error,
    TResult Function(_AppInfoState value)? info,
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
abstract class _$$_AppReadyStateCopyWith<$Res> {
  factory _$$_AppReadyStateCopyWith(
          _$_AppReadyState value, $Res Function(_$_AppReadyState) then) =
      __$$_AppReadyStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AppReadyStateCopyWithImpl<$Res>
    extends _$AppStateStateCopyWithImpl<$Res, _$_AppReadyState>
    implements _$$_AppReadyStateCopyWith<$Res> {
  __$$_AppReadyStateCopyWithImpl(
      _$_AppReadyState _value, $Res Function(_$_AppReadyState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AppReadyState implements _AppReadyState {
  const _$_AppReadyState();

  @override
  String toString() {
    return 'AppStateState.ready()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AppReadyState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() ready,
    required TResult Function(LoadingReason? reason) loading,
    required TResult Function(ErrorReason? reason, VoidCallback? onConfirm)
        error,
    required TResult Function(InfoReason reason, VoidCallback? onConfirm) info,
  }) {
    return ready();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? ready,
    TResult? Function(LoadingReason? reason)? loading,
    TResult? Function(ErrorReason? reason, VoidCallback? onConfirm)? error,
    TResult? Function(InfoReason reason, VoidCallback? onConfirm)? info,
  }) {
    return ready?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? ready,
    TResult Function(LoadingReason? reason)? loading,
    TResult Function(ErrorReason? reason, VoidCallback? onConfirm)? error,
    TResult Function(InfoReason reason, VoidCallback? onConfirm)? info,
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
    required TResult Function(_AppReadyState value) ready,
    required TResult Function(_AppLoadingState value) loading,
    required TResult Function(_AppErrorState value) error,
    required TResult Function(_AppInfoState value) info,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AppReadyState value)? ready,
    TResult? Function(_AppLoadingState value)? loading,
    TResult? Function(_AppErrorState value)? error,
    TResult? Function(_AppInfoState value)? info,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppReadyState value)? ready,
    TResult Function(_AppLoadingState value)? loading,
    TResult Function(_AppErrorState value)? error,
    TResult Function(_AppInfoState value)? info,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class _AppReadyState implements AppStateState {
  const factory _AppReadyState() = _$_AppReadyState;
}

/// @nodoc
abstract class _$$_AppLoadingStateCopyWith<$Res> {
  factory _$$_AppLoadingStateCopyWith(
          _$_AppLoadingState value, $Res Function(_$_AppLoadingState) then) =
      __$$_AppLoadingStateCopyWithImpl<$Res>;
  @useResult
  $Res call({LoadingReason? reason});
}

/// @nodoc
class __$$_AppLoadingStateCopyWithImpl<$Res>
    extends _$AppStateStateCopyWithImpl<$Res, _$_AppLoadingState>
    implements _$$_AppLoadingStateCopyWith<$Res> {
  __$$_AppLoadingStateCopyWithImpl(
      _$_AppLoadingState _value, $Res Function(_$_AppLoadingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = freezed,
  }) {
    return _then(_$_AppLoadingState(
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as LoadingReason?,
    ));
  }
}

/// @nodoc

class _$_AppLoadingState implements _AppLoadingState {
  const _$_AppLoadingState({this.reason});

  @override
  final LoadingReason? reason;

  @override
  String toString() {
    return 'AppStateState.loading(reason: $reason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppLoadingState &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppLoadingStateCopyWith<_$_AppLoadingState> get copyWith =>
      __$$_AppLoadingStateCopyWithImpl<_$_AppLoadingState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() ready,
    required TResult Function(LoadingReason? reason) loading,
    required TResult Function(ErrorReason? reason, VoidCallback? onConfirm)
        error,
    required TResult Function(InfoReason reason, VoidCallback? onConfirm) info,
  }) {
    return loading(reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? ready,
    TResult? Function(LoadingReason? reason)? loading,
    TResult? Function(ErrorReason? reason, VoidCallback? onConfirm)? error,
    TResult? Function(InfoReason reason, VoidCallback? onConfirm)? info,
  }) {
    return loading?.call(reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? ready,
    TResult Function(LoadingReason? reason)? loading,
    TResult Function(ErrorReason? reason, VoidCallback? onConfirm)? error,
    TResult Function(InfoReason reason, VoidCallback? onConfirm)? info,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppReadyState value) ready,
    required TResult Function(_AppLoadingState value) loading,
    required TResult Function(_AppErrorState value) error,
    required TResult Function(_AppInfoState value) info,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AppReadyState value)? ready,
    TResult? Function(_AppLoadingState value)? loading,
    TResult? Function(_AppErrorState value)? error,
    TResult? Function(_AppInfoState value)? info,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppReadyState value)? ready,
    TResult Function(_AppLoadingState value)? loading,
    TResult Function(_AppErrorState value)? error,
    TResult Function(_AppInfoState value)? info,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _AppLoadingState implements AppStateState {
  const factory _AppLoadingState({final LoadingReason? reason}) =
      _$_AppLoadingState;

  LoadingReason? get reason;
  @JsonKey(ignore: true)
  _$$_AppLoadingStateCopyWith<_$_AppLoadingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AppErrorStateCopyWith<$Res> {
  factory _$$_AppErrorStateCopyWith(
          _$_AppErrorState value, $Res Function(_$_AppErrorState) then) =
      __$$_AppErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({ErrorReason? reason, VoidCallback? onConfirm});
}

/// @nodoc
class __$$_AppErrorStateCopyWithImpl<$Res>
    extends _$AppStateStateCopyWithImpl<$Res, _$_AppErrorState>
    implements _$$_AppErrorStateCopyWith<$Res> {
  __$$_AppErrorStateCopyWithImpl(
      _$_AppErrorState _value, $Res Function(_$_AppErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = freezed,
    Object? onConfirm = freezed,
  }) {
    return _then(_$_AppErrorState(
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as ErrorReason?,
      onConfirm: freezed == onConfirm
          ? _value.onConfirm
          : onConfirm // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
    ));
  }
}

/// @nodoc

class _$_AppErrorState implements _AppErrorState {
  const _$_AppErrorState({this.reason, this.onConfirm});

  @override
  final ErrorReason? reason;
  @override
  final VoidCallback? onConfirm;

  @override
  String toString() {
    return 'AppStateState.error(reason: $reason, onConfirm: $onConfirm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppErrorState &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.onConfirm, onConfirm) ||
                other.onConfirm == onConfirm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reason, onConfirm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppErrorStateCopyWith<_$_AppErrorState> get copyWith =>
      __$$_AppErrorStateCopyWithImpl<_$_AppErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() ready,
    required TResult Function(LoadingReason? reason) loading,
    required TResult Function(ErrorReason? reason, VoidCallback? onConfirm)
        error,
    required TResult Function(InfoReason reason, VoidCallback? onConfirm) info,
  }) {
    return error(reason, onConfirm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? ready,
    TResult? Function(LoadingReason? reason)? loading,
    TResult? Function(ErrorReason? reason, VoidCallback? onConfirm)? error,
    TResult? Function(InfoReason reason, VoidCallback? onConfirm)? info,
  }) {
    return error?.call(reason, onConfirm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? ready,
    TResult Function(LoadingReason? reason)? loading,
    TResult Function(ErrorReason? reason, VoidCallback? onConfirm)? error,
    TResult Function(InfoReason reason, VoidCallback? onConfirm)? info,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(reason, onConfirm);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppReadyState value) ready,
    required TResult Function(_AppLoadingState value) loading,
    required TResult Function(_AppErrorState value) error,
    required TResult Function(_AppInfoState value) info,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AppReadyState value)? ready,
    TResult? Function(_AppLoadingState value)? loading,
    TResult? Function(_AppErrorState value)? error,
    TResult? Function(_AppInfoState value)? info,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppReadyState value)? ready,
    TResult Function(_AppLoadingState value)? loading,
    TResult Function(_AppErrorState value)? error,
    TResult Function(_AppInfoState value)? info,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _AppErrorState implements AppStateState {
  const factory _AppErrorState(
      {final ErrorReason? reason,
      final VoidCallback? onConfirm}) = _$_AppErrorState;

  ErrorReason? get reason;
  VoidCallback? get onConfirm;
  @JsonKey(ignore: true)
  _$$_AppErrorStateCopyWith<_$_AppErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AppInfoStateCopyWith<$Res> {
  factory _$$_AppInfoStateCopyWith(
          _$_AppInfoState value, $Res Function(_$_AppInfoState) then) =
      __$$_AppInfoStateCopyWithImpl<$Res>;
  @useResult
  $Res call({InfoReason reason, VoidCallback? onConfirm});
}

/// @nodoc
class __$$_AppInfoStateCopyWithImpl<$Res>
    extends _$AppStateStateCopyWithImpl<$Res, _$_AppInfoState>
    implements _$$_AppInfoStateCopyWith<$Res> {
  __$$_AppInfoStateCopyWithImpl(
      _$_AppInfoState _value, $Res Function(_$_AppInfoState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = null,
    Object? onConfirm = freezed,
  }) {
    return _then(_$_AppInfoState(
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as InfoReason,
      onConfirm: freezed == onConfirm
          ? _value.onConfirm
          : onConfirm // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
    ));
  }
}

/// @nodoc

class _$_AppInfoState implements _AppInfoState {
  const _$_AppInfoState({required this.reason, required this.onConfirm});

  @override
  final InfoReason reason;
  @override
  final VoidCallback? onConfirm;

  @override
  String toString() {
    return 'AppStateState.info(reason: $reason, onConfirm: $onConfirm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppInfoState &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.onConfirm, onConfirm) ||
                other.onConfirm == onConfirm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reason, onConfirm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppInfoStateCopyWith<_$_AppInfoState> get copyWith =>
      __$$_AppInfoStateCopyWithImpl<_$_AppInfoState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() ready,
    required TResult Function(LoadingReason? reason) loading,
    required TResult Function(ErrorReason? reason, VoidCallback? onConfirm)
        error,
    required TResult Function(InfoReason reason, VoidCallback? onConfirm) info,
  }) {
    return info(reason, onConfirm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? ready,
    TResult? Function(LoadingReason? reason)? loading,
    TResult? Function(ErrorReason? reason, VoidCallback? onConfirm)? error,
    TResult? Function(InfoReason reason, VoidCallback? onConfirm)? info,
  }) {
    return info?.call(reason, onConfirm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? ready,
    TResult Function(LoadingReason? reason)? loading,
    TResult Function(ErrorReason? reason, VoidCallback? onConfirm)? error,
    TResult Function(InfoReason reason, VoidCallback? onConfirm)? info,
    required TResult orElse(),
  }) {
    if (info != null) {
      return info(reason, onConfirm);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppReadyState value) ready,
    required TResult Function(_AppLoadingState value) loading,
    required TResult Function(_AppErrorState value) error,
    required TResult Function(_AppInfoState value) info,
  }) {
    return info(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AppReadyState value)? ready,
    TResult? Function(_AppLoadingState value)? loading,
    TResult? Function(_AppErrorState value)? error,
    TResult? Function(_AppInfoState value)? info,
  }) {
    return info?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppReadyState value)? ready,
    TResult Function(_AppLoadingState value)? loading,
    TResult Function(_AppErrorState value)? error,
    TResult Function(_AppInfoState value)? info,
    required TResult orElse(),
  }) {
    if (info != null) {
      return info(this);
    }
    return orElse();
  }
}

abstract class _AppInfoState implements AppStateState {
  const factory _AppInfoState(
      {required final InfoReason reason,
      required final VoidCallback? onConfirm}) = _$_AppInfoState;

  InfoReason get reason;
  VoidCallback? get onConfirm;
  @JsonKey(ignore: true)
  _$$_AppInfoStateCopyWith<_$_AppInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}
