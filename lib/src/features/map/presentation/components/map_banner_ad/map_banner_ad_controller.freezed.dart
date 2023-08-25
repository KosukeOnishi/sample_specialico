// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_banner_ad_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MapBannerAdState {
  bool get isLoading => throw _privateConstructorUsedError;
  AdWithView? get ad => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapBannerAdStateCopyWith<MapBannerAdState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapBannerAdStateCopyWith<$Res> {
  factory $MapBannerAdStateCopyWith(
          MapBannerAdState value, $Res Function(MapBannerAdState) then) =
      _$MapBannerAdStateCopyWithImpl<$Res, MapBannerAdState>;
  @useResult
  $Res call({bool isLoading, AdWithView? ad});
}

/// @nodoc
class _$MapBannerAdStateCopyWithImpl<$Res, $Val extends MapBannerAdState>
    implements $MapBannerAdStateCopyWith<$Res> {
  _$MapBannerAdStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_MapBannerAdStateCopyWith<$Res>
    implements $MapBannerAdStateCopyWith<$Res> {
  factory _$$_MapBannerAdStateCopyWith(
          _$_MapBannerAdState value, $Res Function(_$_MapBannerAdState) then) =
      __$$_MapBannerAdStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, AdWithView? ad});
}

/// @nodoc
class __$$_MapBannerAdStateCopyWithImpl<$Res>
    extends _$MapBannerAdStateCopyWithImpl<$Res, _$_MapBannerAdState>
    implements _$$_MapBannerAdStateCopyWith<$Res> {
  __$$_MapBannerAdStateCopyWithImpl(
      _$_MapBannerAdState _value, $Res Function(_$_MapBannerAdState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? ad = freezed,
  }) {
    return _then(_$_MapBannerAdState(
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

class _$_MapBannerAdState implements _MapBannerAdState {
  const _$_MapBannerAdState({this.isLoading = true, this.ad});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final AdWithView? ad;

  @override
  String toString() {
    return 'MapBannerAdState(isLoading: $isLoading, ad: $ad)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MapBannerAdState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.ad, ad) || other.ad == ad));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, ad);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MapBannerAdStateCopyWith<_$_MapBannerAdState> get copyWith =>
      __$$_MapBannerAdStateCopyWithImpl<_$_MapBannerAdState>(this, _$identity);
}

abstract class _MapBannerAdState implements MapBannerAdState {
  const factory _MapBannerAdState(
      {final bool isLoading, final AdWithView? ad}) = _$_MapBannerAdState;

  @override
  bool get isLoading;
  @override
  AdWithView? get ad;
  @override
  @JsonKey(ignore: true)
  _$$_MapBannerAdStateCopyWith<_$_MapBannerAdState> get copyWith =>
      throw _privateConstructorUsedError;
}
