// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_list_screen_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShopListScreenState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isFirstFetch => throw _privateConstructorUsedError;
  dynamic get isAdLoading => throw _privateConstructorUsedError;
  dynamic get isFirstAdsLoading => throw _privateConstructorUsedError;
  bool get isFetchReady => throw _privateConstructorUsedError;
  List<AdWithView> get adList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShopListScreenStateCopyWith<ShopListScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopListScreenStateCopyWith<$Res> {
  factory $ShopListScreenStateCopyWith(
          ShopListScreenState value, $Res Function(ShopListScreenState) then) =
      _$ShopListScreenStateCopyWithImpl<$Res, ShopListScreenState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isFirstFetch,
      dynamic isAdLoading,
      dynamic isFirstAdsLoading,
      bool isFetchReady,
      List<AdWithView> adList});
}

/// @nodoc
class _$ShopListScreenStateCopyWithImpl<$Res, $Val extends ShopListScreenState>
    implements $ShopListScreenStateCopyWith<$Res> {
  _$ShopListScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isFirstFetch = null,
    Object? isAdLoading = freezed,
    Object? isFirstAdsLoading = freezed,
    Object? isFetchReady = null,
    Object? adList = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFirstFetch: null == isFirstFetch
          ? _value.isFirstFetch
          : isFirstFetch // ignore: cast_nullable_to_non_nullable
              as bool,
      isAdLoading: freezed == isAdLoading
          ? _value.isAdLoading
          : isAdLoading // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isFirstAdsLoading: freezed == isFirstAdsLoading
          ? _value.isFirstAdsLoading
          : isFirstAdsLoading // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isFetchReady: null == isFetchReady
          ? _value.isFetchReady
          : isFetchReady // ignore: cast_nullable_to_non_nullable
              as bool,
      adList: null == adList
          ? _value.adList
          : adList // ignore: cast_nullable_to_non_nullable
              as List<AdWithView>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShopListScreenStateCopyWith<$Res>
    implements $ShopListScreenStateCopyWith<$Res> {
  factory _$$_ShopListScreenStateCopyWith(_$_ShopListScreenState value,
          $Res Function(_$_ShopListScreenState) then) =
      __$$_ShopListScreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isFirstFetch,
      dynamic isAdLoading,
      dynamic isFirstAdsLoading,
      bool isFetchReady,
      List<AdWithView> adList});
}

/// @nodoc
class __$$_ShopListScreenStateCopyWithImpl<$Res>
    extends _$ShopListScreenStateCopyWithImpl<$Res, _$_ShopListScreenState>
    implements _$$_ShopListScreenStateCopyWith<$Res> {
  __$$_ShopListScreenStateCopyWithImpl(_$_ShopListScreenState _value,
      $Res Function(_$_ShopListScreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isFirstFetch = null,
    Object? isAdLoading = freezed,
    Object? isFirstAdsLoading = freezed,
    Object? isFetchReady = null,
    Object? adList = null,
  }) {
    return _then(_$_ShopListScreenState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFirstFetch: null == isFirstFetch
          ? _value.isFirstFetch
          : isFirstFetch // ignore: cast_nullable_to_non_nullable
              as bool,
      isAdLoading: freezed == isAdLoading ? _value.isAdLoading! : isAdLoading,
      isFirstAdsLoading: freezed == isFirstAdsLoading
          ? _value.isFirstAdsLoading!
          : isFirstAdsLoading,
      isFetchReady: null == isFetchReady
          ? _value.isFetchReady
          : isFetchReady // ignore: cast_nullable_to_non_nullable
              as bool,
      adList: null == adList
          ? _value._adList
          : adList // ignore: cast_nullable_to_non_nullable
              as List<AdWithView>,
    ));
  }
}

/// @nodoc

class _$_ShopListScreenState implements _ShopListScreenState {
  const _$_ShopListScreenState(
      {required this.isLoading,
      required this.isFirstFetch,
      this.isAdLoading = false,
      this.isFirstAdsLoading = true,
      this.isFetchReady = true,
      final List<AdWithView> adList = const []})
      : _adList = adList;

  @override
  final bool isLoading;
  @override
  final bool isFirstFetch;
  @override
  @JsonKey()
  final dynamic isAdLoading;
  @override
  @JsonKey()
  final dynamic isFirstAdsLoading;
  @override
  @JsonKey()
  final bool isFetchReady;
  final List<AdWithView> _adList;
  @override
  @JsonKey()
  List<AdWithView> get adList {
    if (_adList is EqualUnmodifiableListView) return _adList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_adList);
  }

  @override
  String toString() {
    return 'ShopListScreenState(isLoading: $isLoading, isFirstFetch: $isFirstFetch, isAdLoading: $isAdLoading, isFirstAdsLoading: $isFirstAdsLoading, isFetchReady: $isFetchReady, adList: $adList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShopListScreenState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isFirstFetch, isFirstFetch) ||
                other.isFirstFetch == isFirstFetch) &&
            const DeepCollectionEquality()
                .equals(other.isAdLoading, isAdLoading) &&
            const DeepCollectionEquality()
                .equals(other.isFirstAdsLoading, isFirstAdsLoading) &&
            (identical(other.isFetchReady, isFetchReady) ||
                other.isFetchReady == isFetchReady) &&
            const DeepCollectionEquality().equals(other._adList, _adList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isFirstFetch,
      const DeepCollectionEquality().hash(isAdLoading),
      const DeepCollectionEquality().hash(isFirstAdsLoading),
      isFetchReady,
      const DeepCollectionEquality().hash(_adList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShopListScreenStateCopyWith<_$_ShopListScreenState> get copyWith =>
      __$$_ShopListScreenStateCopyWithImpl<_$_ShopListScreenState>(
          this, _$identity);
}

abstract class _ShopListScreenState implements ShopListScreenState {
  const factory _ShopListScreenState(
      {required final bool isLoading,
      required final bool isFirstFetch,
      final dynamic isAdLoading,
      final dynamic isFirstAdsLoading,
      final bool isFetchReady,
      final List<AdWithView> adList}) = _$_ShopListScreenState;

  @override
  bool get isLoading;
  @override
  bool get isFirstFetch;
  @override
  dynamic get isAdLoading;
  @override
  dynamic get isFirstAdsLoading;
  @override
  bool get isFetchReady;
  @override
  List<AdWithView> get adList;
  @override
  @JsonKey(ignore: true)
  _$$_ShopListScreenStateCopyWith<_$_ShopListScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
