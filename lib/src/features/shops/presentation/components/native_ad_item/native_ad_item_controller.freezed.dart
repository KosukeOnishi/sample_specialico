// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'native_ad_item_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NativeAdItemState {
  bool get isLoading => throw _privateConstructorUsedError;
  AdWithView? get ad => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NativeAdItemStateCopyWith<NativeAdItemState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NativeAdItemStateCopyWith<$Res> {
  factory $NativeAdItemStateCopyWith(
          NativeAdItemState value, $Res Function(NativeAdItemState) then) =
      _$NativeAdItemStateCopyWithImpl<$Res, NativeAdItemState>;
  @useResult
  $Res call({bool isLoading, AdWithView? ad});
}

/// @nodoc
class _$NativeAdItemStateCopyWithImpl<$Res, $Val extends NativeAdItemState>
    implements $NativeAdItemStateCopyWith<$Res> {
  _$NativeAdItemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? ad = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      ad: freezed == ad
          ? _value.ad
          : ad // ignore: cast_nullable_to_non_nullable
              as AdWithView?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NativeAdItemStateCopyWith<$Res>
    implements $NativeAdItemStateCopyWith<$Res> {
  factory _$$_NativeAdItemStateCopyWith(_$_NativeAdItemState value,
          $Res Function(_$_NativeAdItemState) then) =
      __$$_NativeAdItemStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, AdWithView? ad});
}

/// @nodoc
class __$$_NativeAdItemStateCopyWithImpl<$Res>
    extends _$NativeAdItemStateCopyWithImpl<$Res, _$_NativeAdItemState>
    implements _$$_NativeAdItemStateCopyWith<$Res> {
  __$$_NativeAdItemStateCopyWithImpl(
      _$_NativeAdItemState _value, $Res Function(_$_NativeAdItemState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? ad = freezed,
  }) {
    return _then(_$_NativeAdItemState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      ad: freezed == ad
          ? _value.ad
          : ad // ignore: cast_nullable_to_non_nullable
              as AdWithView?,
    ));
  }
}

/// @nodoc

class _$_NativeAdItemState implements _NativeAdItemState {
  const _$_NativeAdItemState({this.isLoading = true, this.ad});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final AdWithView? ad;

  @override
  String toString() {
    return 'NativeAdItemState(isLoading: $isLoading, ad: $ad)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NativeAdItemState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.ad, ad) || other.ad == ad));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, ad);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NativeAdItemStateCopyWith<_$_NativeAdItemState> get copyWith =>
      __$$_NativeAdItemStateCopyWithImpl<_$_NativeAdItemState>(
          this, _$identity);
}

abstract class _NativeAdItemState implements NativeAdItemState {
  const factory _NativeAdItemState(
      {final bool isLoading, final AdWithView? ad}) = _$_NativeAdItemState;

  @override
  bool get isLoading;
  @override
  AdWithView? get ad;
  @override
  @JsonKey(ignore: true)
  _$$_NativeAdItemStateCopyWith<_$_NativeAdItemState> get copyWith =>
      throw _privateConstructorUsedError;
}
