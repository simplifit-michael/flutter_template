// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connection_monitor_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ConnectionMonitorState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noInternet,
    required TResult Function() ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noInternet,
    TResult? Function()? ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noInternet,
    TResult Function()? ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoInternetState value) noInternet,
    required TResult Function(_ReadyState value) ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NoInternetState value)? noInternet,
    TResult? Function(_ReadyState value)? ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoInternetState value)? noInternet,
    TResult Function(_ReadyState value)? ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectionMonitorStateCopyWith<$Res> {
  factory $ConnectionMonitorStateCopyWith(ConnectionMonitorState value,
          $Res Function(ConnectionMonitorState) then) =
      _$ConnectionMonitorStateCopyWithImpl<$Res, ConnectionMonitorState>;
}

/// @nodoc
class _$ConnectionMonitorStateCopyWithImpl<$Res,
        $Val extends ConnectionMonitorState>
    implements $ConnectionMonitorStateCopyWith<$Res> {
  _$ConnectionMonitorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_NoInternetStateCopyWith<$Res> {
  factory _$$_NoInternetStateCopyWith(
          _$_NoInternetState value, $Res Function(_$_NoInternetState) then) =
      __$$_NoInternetStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NoInternetStateCopyWithImpl<$Res>
    extends _$ConnectionMonitorStateCopyWithImpl<$Res, _$_NoInternetState>
    implements _$$_NoInternetStateCopyWith<$Res> {
  __$$_NoInternetStateCopyWithImpl(
      _$_NoInternetState _value, $Res Function(_$_NoInternetState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_NoInternetState implements _NoInternetState {
  const _$_NoInternetState();

  @override
  String toString() {
    return 'ConnectionMonitorState.noInternet()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_NoInternetState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noInternet,
    required TResult Function() ready,
  }) {
    return noInternet();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noInternet,
    TResult? Function()? ready,
  }) {
    return noInternet?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noInternet,
    TResult Function()? ready,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoInternetState value) noInternet,
    required TResult Function(_ReadyState value) ready,
  }) {
    return noInternet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NoInternetState value)? noInternet,
    TResult? Function(_ReadyState value)? ready,
  }) {
    return noInternet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoInternetState value)? noInternet,
    TResult Function(_ReadyState value)? ready,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet(this);
    }
    return orElse();
  }
}

abstract class _NoInternetState implements ConnectionMonitorState {
  const factory _NoInternetState() = _$_NoInternetState;
}

/// @nodoc
abstract class _$$_ReadyStateCopyWith<$Res> {
  factory _$$_ReadyStateCopyWith(
          _$_ReadyState value, $Res Function(_$_ReadyState) then) =
      __$$_ReadyStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ReadyStateCopyWithImpl<$Res>
    extends _$ConnectionMonitorStateCopyWithImpl<$Res, _$_ReadyState>
    implements _$$_ReadyStateCopyWith<$Res> {
  __$$_ReadyStateCopyWithImpl(
      _$_ReadyState _value, $Res Function(_$_ReadyState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ReadyState implements _ReadyState {
  const _$_ReadyState();

  @override
  String toString() {
    return 'ConnectionMonitorState.ready()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ReadyState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noInternet,
    required TResult Function() ready,
  }) {
    return ready();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noInternet,
    TResult? Function()? ready,
  }) {
    return ready?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noInternet,
    TResult Function()? ready,
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
    required TResult Function(_NoInternetState value) noInternet,
    required TResult Function(_ReadyState value) ready,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NoInternetState value)? noInternet,
    TResult? Function(_ReadyState value)? ready,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoInternetState value)? noInternet,
    TResult Function(_ReadyState value)? ready,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class _ReadyState implements ConnectionMonitorState {
  const factory _ReadyState() = _$_ReadyState;
}
