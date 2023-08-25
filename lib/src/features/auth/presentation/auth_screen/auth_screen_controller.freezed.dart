// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_screen_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthScreenState {
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthScreenStateCopyWith<AuthScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthScreenStateCopyWith<$Res> {
  factory $AuthScreenStateCopyWith(
          AuthScreenState value, $Res Function(AuthScreenState) then) =
      _$AuthScreenStateCopyWithImpl<$Res, AuthScreenState>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$AuthScreenStateCopyWithImpl<$Res, $Val extends AuthScreenState>
    implements $AuthScreenStateCopyWith<$Res> {
  _$AuthScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthScreenStateCopyWith<$Res>
    implements $AuthScreenStateCopyWith<$Res> {
  factory _$$_AuthScreenStateCopyWith(
          _$_AuthScreenState value, $Res Function(_$_AuthScreenState) then) =
      __$$_AuthScreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$_AuthScreenStateCopyWithImpl<$Res>
    extends _$AuthScreenStateCopyWithImpl<$Res, _$_AuthScreenState>
    implements _$$_AuthScreenStateCopyWith<$Res> {
  __$$_AuthScreenStateCopyWithImpl(
      _$_AuthScreenState _value, $Res Function(_$_AuthScreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$_AuthScreenState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AuthScreenState implements _AuthScreenState {
  const _$_AuthScreenState({this.isLoading = false});

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'AuthScreenState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthScreenState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthScreenStateCopyWith<_$_AuthScreenState> get copyWith =>
      __$$_AuthScreenStateCopyWithImpl<_$_AuthScreenState>(this, _$identity);
}

abstract class _AuthScreenState implements AuthScreenState {
  const factory _AuthScreenState({final bool isLoading}) = _$_AuthScreenState;

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_AuthScreenStateCopyWith<_$_AuthScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
