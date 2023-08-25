// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Shop _$ShopFromJson(Map<String, dynamic> json) {
  return _Shop.fromJson(json);
}

/// @nodoc
mixin _$Shop {
  String get shopId => throw _privateConstructorUsedError;
  String get placeId => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @NullableDateTimeConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get weekdayTexts => throw _privateConstructorUsedError;
  @NullableDateTimeConverter()
  DateTime? get weekdayTextsUpdatedAt => throw _privateConstructorUsedError;
  Map<String, String>? get weekdayTextsUpdatedBy =>
      throw _privateConstructorUsedError;
  String get formattedAddress => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  List<String> get subRegions => throw _privateConstructorUsedError;
  @GeoFirePointConverter()
  GeoFirePoint get position => throw _privateConstructorUsedError;
  String get mapUrl => throw _privateConstructorUsedError;
  @InstagramPostsConverter()
  List<InstagramPost> get instagramPosts => throw _privateConstructorUsedError;
  String? get instagramAccountUrl => throw _privateConstructorUsedError;
  String? get websiteUrl => throw _privateConstructorUsedError;
  int get likedCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShopCopyWith<Shop> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopCopyWith<$Res> {
  factory $ShopCopyWith(Shop value, $Res Function(Shop) then) =
      _$ShopCopyWithImpl<$Res, Shop>;
  @useResult
  $Res call(
      {String shopId,
      String placeId,
      @DateTimeConverter() DateTime createdAt,
      @NullableDateTimeConverter() DateTime? updatedAt,
      String name,
      List<String> weekdayTexts,
      @NullableDateTimeConverter() DateTime? weekdayTextsUpdatedAt,
      Map<String, String>? weekdayTextsUpdatedBy,
      String formattedAddress,
      String country,
      List<String> subRegions,
      @GeoFirePointConverter() GeoFirePoint position,
      String mapUrl,
      @InstagramPostsConverter() List<InstagramPost> instagramPosts,
      String? instagramAccountUrl,
      String? websiteUrl,
      int likedCount});
}

/// @nodoc
class _$ShopCopyWithImpl<$Res, $Val extends Shop>
    implements $ShopCopyWith<$Res> {
  _$ShopCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shopId = null,
    Object? placeId = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? name = null,
    Object? weekdayTexts = null,
    Object? weekdayTextsUpdatedAt = freezed,
    Object? weekdayTextsUpdatedBy = freezed,
    Object? formattedAddress = null,
    Object? country = null,
    Object? subRegions = null,
    Object? position = null,
    Object? mapUrl = null,
    Object? instagramPosts = null,
    Object? instagramAccountUrl = freezed,
    Object? websiteUrl = freezed,
    Object? likedCount = null,
  }) {
    return _then(_value.copyWith(
      shopId: null == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as String,
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      weekdayTexts: null == weekdayTexts
          ? _value.weekdayTexts
          : weekdayTexts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      weekdayTextsUpdatedAt: freezed == weekdayTextsUpdatedAt
          ? _value.weekdayTextsUpdatedAt
          : weekdayTextsUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      weekdayTextsUpdatedBy: freezed == weekdayTextsUpdatedBy
          ? _value.weekdayTextsUpdatedBy
          : weekdayTextsUpdatedBy // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      formattedAddress: null == formattedAddress
          ? _value.formattedAddress
          : formattedAddress // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      subRegions: null == subRegions
          ? _value.subRegions
          : subRegions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as GeoFirePoint,
      mapUrl: null == mapUrl
          ? _value.mapUrl
          : mapUrl // ignore: cast_nullable_to_non_nullable
              as String,
      instagramPosts: null == instagramPosts
          ? _value.instagramPosts
          : instagramPosts // ignore: cast_nullable_to_non_nullable
              as List<InstagramPost>,
      instagramAccountUrl: freezed == instagramAccountUrl
          ? _value.instagramAccountUrl
          : instagramAccountUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      websiteUrl: freezed == websiteUrl
          ? _value.websiteUrl
          : websiteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      likedCount: null == likedCount
          ? _value.likedCount
          : likedCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShopCopyWith<$Res> implements $ShopCopyWith<$Res> {
  factory _$$_ShopCopyWith(_$_Shop value, $Res Function(_$_Shop) then) =
      __$$_ShopCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String shopId,
      String placeId,
      @DateTimeConverter() DateTime createdAt,
      @NullableDateTimeConverter() DateTime? updatedAt,
      String name,
      List<String> weekdayTexts,
      @NullableDateTimeConverter() DateTime? weekdayTextsUpdatedAt,
      Map<String, String>? weekdayTextsUpdatedBy,
      String formattedAddress,
      String country,
      List<String> subRegions,
      @GeoFirePointConverter() GeoFirePoint position,
      String mapUrl,
      @InstagramPostsConverter() List<InstagramPost> instagramPosts,
      String? instagramAccountUrl,
      String? websiteUrl,
      int likedCount});
}

/// @nodoc
class __$$_ShopCopyWithImpl<$Res> extends _$ShopCopyWithImpl<$Res, _$_Shop>
    implements _$$_ShopCopyWith<$Res> {
  __$$_ShopCopyWithImpl(_$_Shop _value, $Res Function(_$_Shop) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shopId = null,
    Object? placeId = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? name = null,
    Object? weekdayTexts = null,
    Object? weekdayTextsUpdatedAt = freezed,
    Object? weekdayTextsUpdatedBy = freezed,
    Object? formattedAddress = null,
    Object? country = null,
    Object? subRegions = null,
    Object? position = null,
    Object? mapUrl = null,
    Object? instagramPosts = null,
    Object? instagramAccountUrl = freezed,
    Object? websiteUrl = freezed,
    Object? likedCount = null,
  }) {
    return _then(_$_Shop(
      shopId: null == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as String,
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      weekdayTexts: null == weekdayTexts
          ? _value._weekdayTexts
          : weekdayTexts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      weekdayTextsUpdatedAt: freezed == weekdayTextsUpdatedAt
          ? _value.weekdayTextsUpdatedAt
          : weekdayTextsUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      weekdayTextsUpdatedBy: freezed == weekdayTextsUpdatedBy
          ? _value._weekdayTextsUpdatedBy
          : weekdayTextsUpdatedBy // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      formattedAddress: null == formattedAddress
          ? _value.formattedAddress
          : formattedAddress // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      subRegions: null == subRegions
          ? _value._subRegions
          : subRegions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as GeoFirePoint,
      mapUrl: null == mapUrl
          ? _value.mapUrl
          : mapUrl // ignore: cast_nullable_to_non_nullable
              as String,
      instagramPosts: null == instagramPosts
          ? _value._instagramPosts
          : instagramPosts // ignore: cast_nullable_to_non_nullable
              as List<InstagramPost>,
      instagramAccountUrl: freezed == instagramAccountUrl
          ? _value.instagramAccountUrl
          : instagramAccountUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      websiteUrl: freezed == websiteUrl
          ? _value.websiteUrl
          : websiteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      likedCount: null == likedCount
          ? _value.likedCount
          : likedCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Shop extends _Shop {
  const _$_Shop(
      {required this.shopId,
      required this.placeId,
      @DateTimeConverter()
          required this.createdAt,
      @NullableDateTimeConverter()
          required this.updatedAt,
      required this.name,
      final List<String> weekdayTexts = const [],
      @NullableDateTimeConverter()
          this.weekdayTextsUpdatedAt,
      final Map<String, String>? weekdayTextsUpdatedBy,
      required this.formattedAddress,
      required this.country,
      final List<String> subRegions = const [],
      @GeoFirePointConverter()
          required this.position,
      required this.mapUrl,
      @InstagramPostsConverter()
          final List<InstagramPost> instagramPosts = const [],
      this.instagramAccountUrl,
      this.websiteUrl,
      required this.likedCount})
      : _weekdayTexts = weekdayTexts,
        _weekdayTextsUpdatedBy = weekdayTextsUpdatedBy,
        _subRegions = subRegions,
        _instagramPosts = instagramPosts,
        super._();

  factory _$_Shop.fromJson(Map<String, dynamic> json) => _$$_ShopFromJson(json);

  @override
  final String shopId;
  @override
  final String placeId;
  @override
  @DateTimeConverter()
  final DateTime createdAt;
  @override
  @NullableDateTimeConverter()
  final DateTime? updatedAt;
  @override
  final String name;
  final List<String> _weekdayTexts;
  @override
  @JsonKey()
  List<String> get weekdayTexts {
    if (_weekdayTexts is EqualUnmodifiableListView) return _weekdayTexts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weekdayTexts);
  }

  @override
  @NullableDateTimeConverter()
  final DateTime? weekdayTextsUpdatedAt;
  final Map<String, String>? _weekdayTextsUpdatedBy;
  @override
  Map<String, String>? get weekdayTextsUpdatedBy {
    final value = _weekdayTextsUpdatedBy;
    if (value == null) return null;
    if (_weekdayTextsUpdatedBy is EqualUnmodifiableMapView)
      return _weekdayTextsUpdatedBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String formattedAddress;
  @override
  final String country;
  final List<String> _subRegions;
  @override
  @JsonKey()
  List<String> get subRegions {
    if (_subRegions is EqualUnmodifiableListView) return _subRegions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subRegions);
  }

  @override
  @GeoFirePointConverter()
  final GeoFirePoint position;
  @override
  final String mapUrl;
  final List<InstagramPost> _instagramPosts;
  @override
  @JsonKey()
  @InstagramPostsConverter()
  List<InstagramPost> get instagramPosts {
    if (_instagramPosts is EqualUnmodifiableListView) return _instagramPosts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_instagramPosts);
  }

  @override
  final String? instagramAccountUrl;
  @override
  final String? websiteUrl;
  @override
  final int likedCount;

  @override
  String toString() {
    return 'Shop(shopId: $shopId, placeId: $placeId, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, weekdayTexts: $weekdayTexts, weekdayTextsUpdatedAt: $weekdayTextsUpdatedAt, weekdayTextsUpdatedBy: $weekdayTextsUpdatedBy, formattedAddress: $formattedAddress, country: $country, subRegions: $subRegions, position: $position, mapUrl: $mapUrl, instagramPosts: $instagramPosts, instagramAccountUrl: $instagramAccountUrl, websiteUrl: $websiteUrl, likedCount: $likedCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Shop &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._weekdayTexts, _weekdayTexts) &&
            (identical(other.weekdayTextsUpdatedAt, weekdayTextsUpdatedAt) ||
                other.weekdayTextsUpdatedAt == weekdayTextsUpdatedAt) &&
            const DeepCollectionEquality()
                .equals(other._weekdayTextsUpdatedBy, _weekdayTextsUpdatedBy) &&
            (identical(other.formattedAddress, formattedAddress) ||
                other.formattedAddress == formattedAddress) &&
            (identical(other.country, country) || other.country == country) &&
            const DeepCollectionEquality()
                .equals(other._subRegions, _subRegions) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.mapUrl, mapUrl) || other.mapUrl == mapUrl) &&
            const DeepCollectionEquality()
                .equals(other._instagramPosts, _instagramPosts) &&
            (identical(other.instagramAccountUrl, instagramAccountUrl) ||
                other.instagramAccountUrl == instagramAccountUrl) &&
            (identical(other.websiteUrl, websiteUrl) ||
                other.websiteUrl == websiteUrl) &&
            (identical(other.likedCount, likedCount) ||
                other.likedCount == likedCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      shopId,
      placeId,
      createdAt,
      updatedAt,
      name,
      const DeepCollectionEquality().hash(_weekdayTexts),
      weekdayTextsUpdatedAt,
      const DeepCollectionEquality().hash(_weekdayTextsUpdatedBy),
      formattedAddress,
      country,
      const DeepCollectionEquality().hash(_subRegions),
      position,
      mapUrl,
      const DeepCollectionEquality().hash(_instagramPosts),
      instagramAccountUrl,
      websiteUrl,
      likedCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShopCopyWith<_$_Shop> get copyWith =>
      __$$_ShopCopyWithImpl<_$_Shop>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShopToJson(
      this,
    );
  }
}

abstract class _Shop extends Shop {
  const factory _Shop(
      {required final String shopId,
      required final String placeId,
      @DateTimeConverter() required final DateTime createdAt,
      @NullableDateTimeConverter() required final DateTime? updatedAt,
      required final String name,
      final List<String> weekdayTexts,
      @NullableDateTimeConverter() final DateTime? weekdayTextsUpdatedAt,
      final Map<String, String>? weekdayTextsUpdatedBy,
      required final String formattedAddress,
      required final String country,
      final List<String> subRegions,
      @GeoFirePointConverter() required final GeoFirePoint position,
      required final String mapUrl,
      @InstagramPostsConverter() final List<InstagramPost> instagramPosts,
      final String? instagramAccountUrl,
      final String? websiteUrl,
      required final int likedCount}) = _$_Shop;
  const _Shop._() : super._();

  factory _Shop.fromJson(Map<String, dynamic> json) = _$_Shop.fromJson;

  @override
  String get shopId;
  @override
  String get placeId;
  @override
  @DateTimeConverter()
  DateTime get createdAt;
  @override
  @NullableDateTimeConverter()
  DateTime? get updatedAt;
  @override
  String get name;
  @override
  List<String> get weekdayTexts;
  @override
  @NullableDateTimeConverter()
  DateTime? get weekdayTextsUpdatedAt;
  @override
  Map<String, String>? get weekdayTextsUpdatedBy;
  @override
  String get formattedAddress;
  @override
  String get country;
  @override
  List<String> get subRegions;
  @override
  @GeoFirePointConverter()
  GeoFirePoint get position;
  @override
  String get mapUrl;
  @override
  @InstagramPostsConverter()
  List<InstagramPost> get instagramPosts;
  @override
  String? get instagramAccountUrl;
  @override
  String? get websiteUrl;
  @override
  int get likedCount;
  @override
  @JsonKey(ignore: true)
  _$$_ShopCopyWith<_$_Shop> get copyWith => throw _privateConstructorUsedError;
}
