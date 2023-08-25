// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'liked_shop_document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LikedShopDocument _$LikedShopDocumentFromJson(Map<String, dynamic> json) {
  return _LikedShopDocument.fromJson(json);
}

/// @nodoc
mixin _$LikedShopDocument {
  String get likedShopId => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @NullableDateTimeConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String get shopId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  @ShopSnippetConverter()
  ShopSnippet get shopSnippet => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LikedShopDocumentCopyWith<LikedShopDocument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikedShopDocumentCopyWith<$Res> {
  factory $LikedShopDocumentCopyWith(
          LikedShopDocument value, $Res Function(LikedShopDocument) then) =
      _$LikedShopDocumentCopyWithImpl<$Res, LikedShopDocument>;
  @useResult
  $Res call(
      {String likedShopId,
      @DateTimeConverter() DateTime createdAt,
      @NullableDateTimeConverter() DateTime? updatedAt,
      String shopId,
      String userId,
      @ShopSnippetConverter() ShopSnippet shopSnippet});

  $ShopSnippetCopyWith<$Res> get shopSnippet;
}

/// @nodoc
class _$LikedShopDocumentCopyWithImpl<$Res, $Val extends LikedShopDocument>
    implements $LikedShopDocumentCopyWith<$Res> {
  _$LikedShopDocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? likedShopId = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? shopId = null,
    Object? userId = null,
    Object? shopSnippet = null,
  }) {
    return _then(_value.copyWith(
      likedShopId: null == likedShopId
          ? _value.likedShopId
          : likedShopId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shopId: null == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      shopSnippet: null == shopSnippet
          ? _value.shopSnippet
          : shopSnippet // ignore: cast_nullable_to_non_nullable
              as ShopSnippet,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ShopSnippetCopyWith<$Res> get shopSnippet {
    return $ShopSnippetCopyWith<$Res>(_value.shopSnippet, (value) {
      return _then(_value.copyWith(shopSnippet: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LikedShopDocumentCopyWith<$Res>
    implements $LikedShopDocumentCopyWith<$Res> {
  factory _$$_LikedShopDocumentCopyWith(_$_LikedShopDocument value,
          $Res Function(_$_LikedShopDocument) then) =
      __$$_LikedShopDocumentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String likedShopId,
      @DateTimeConverter() DateTime createdAt,
      @NullableDateTimeConverter() DateTime? updatedAt,
      String shopId,
      String userId,
      @ShopSnippetConverter() ShopSnippet shopSnippet});

  @override
  $ShopSnippetCopyWith<$Res> get shopSnippet;
}

/// @nodoc
class __$$_LikedShopDocumentCopyWithImpl<$Res>
    extends _$LikedShopDocumentCopyWithImpl<$Res, _$_LikedShopDocument>
    implements _$$_LikedShopDocumentCopyWith<$Res> {
  __$$_LikedShopDocumentCopyWithImpl(
      _$_LikedShopDocument _value, $Res Function(_$_LikedShopDocument) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? likedShopId = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? shopId = null,
    Object? userId = null,
    Object? shopSnippet = null,
  }) {
    return _then(_$_LikedShopDocument(
      likedShopId: null == likedShopId
          ? _value.likedShopId
          : likedShopId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shopId: null == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      shopSnippet: null == shopSnippet
          ? _value.shopSnippet
          : shopSnippet // ignore: cast_nullable_to_non_nullable
              as ShopSnippet,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LikedShopDocument extends _LikedShopDocument {
  const _$_LikedShopDocument(
      {required this.likedShopId,
      @DateTimeConverter() required this.createdAt,
      @NullableDateTimeConverter() required this.updatedAt,
      required this.shopId,
      required this.userId,
      @ShopSnippetConverter() required this.shopSnippet})
      : super._();

  factory _$_LikedShopDocument.fromJson(Map<String, dynamic> json) =>
      _$$_LikedShopDocumentFromJson(json);

  @override
  final String likedShopId;
  @override
  @DateTimeConverter()
  final DateTime createdAt;
  @override
  @NullableDateTimeConverter()
  final DateTime? updatedAt;
  @override
  final String shopId;
  @override
  final String userId;
  @override
  @ShopSnippetConverter()
  final ShopSnippet shopSnippet;

  @override
  String toString() {
    return 'LikedShopDocument(likedShopId: $likedShopId, createdAt: $createdAt, updatedAt: $updatedAt, shopId: $shopId, userId: $userId, shopSnippet: $shopSnippet)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LikedShopDocument &&
            (identical(other.likedShopId, likedShopId) ||
                other.likedShopId == likedShopId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.shopSnippet, shopSnippet) ||
                other.shopSnippet == shopSnippet));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, likedShopId, createdAt,
      updatedAt, shopId, userId, shopSnippet);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LikedShopDocumentCopyWith<_$_LikedShopDocument> get copyWith =>
      __$$_LikedShopDocumentCopyWithImpl<_$_LikedShopDocument>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LikedShopDocumentToJson(
      this,
    );
  }
}

abstract class _LikedShopDocument extends LikedShopDocument {
  const factory _LikedShopDocument(
          {required final String likedShopId,
          @DateTimeConverter() required final DateTime createdAt,
          @NullableDateTimeConverter() required final DateTime? updatedAt,
          required final String shopId,
          required final String userId,
          @ShopSnippetConverter() required final ShopSnippet shopSnippet}) =
      _$_LikedShopDocument;
  const _LikedShopDocument._() : super._();

  factory _LikedShopDocument.fromJson(Map<String, dynamic> json) =
      _$_LikedShopDocument.fromJson;

  @override
  String get likedShopId;
  @override
  @DateTimeConverter()
  DateTime get createdAt;
  @override
  @NullableDateTimeConverter()
  DateTime? get updatedAt;
  @override
  String get shopId;
  @override
  String get userId;
  @override
  @ShopSnippetConverter()
  ShopSnippet get shopSnippet;
  @override
  @JsonKey(ignore: true)
  _$$_LikedShopDocumentCopyWith<_$_LikedShopDocument> get copyWith =>
      throw _privateConstructorUsedError;
}
