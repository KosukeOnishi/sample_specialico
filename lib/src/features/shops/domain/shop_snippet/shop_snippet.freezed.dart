// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_snippet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShopSnippet _$ShopSnippetFromJson(Map<String, dynamic> json) {
  return _ShopSnippet.fromJson(json);
}

/// @nodoc
mixin _$ShopSnippet {
  String get shopId => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @GeoFirePointConverter()
  GeoFirePoint get position => throw _privateConstructorUsedError;
  String get thumbnailImageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShopSnippetCopyWith<ShopSnippet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopSnippetCopyWith<$Res> {
  factory $ShopSnippetCopyWith(
          ShopSnippet value, $Res Function(ShopSnippet) then) =
      _$ShopSnippetCopyWithImpl<$Res, ShopSnippet>;
  @useResult
  $Res call(
      {String shopId,
      @DateTimeConverter() DateTime createdAt,
      String name,
      @GeoFirePointConverter() GeoFirePoint position,
      String thumbnailImageUrl});
}

/// @nodoc
class _$ShopSnippetCopyWithImpl<$Res, $Val extends ShopSnippet>
    implements $ShopSnippetCopyWith<$Res> {
  _$ShopSnippetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shopId = null,
    Object? createdAt = null,
    Object? name = null,
    Object? position = null,
    Object? thumbnailImageUrl = null,
  }) {
    return _then(_value.copyWith(
      shopId: null == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as GeoFirePoint,
      thumbnailImageUrl: null == thumbnailImageUrl
          ? _value.thumbnailImageUrl
          : thumbnailImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShopSnippetCopyWith<$Res>
    implements $ShopSnippetCopyWith<$Res> {
  factory _$$_ShopSnippetCopyWith(
          _$_ShopSnippet value, $Res Function(_$_ShopSnippet) then) =
      __$$_ShopSnippetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String shopId,
      @DateTimeConverter() DateTime createdAt,
      String name,
      @GeoFirePointConverter() GeoFirePoint position,
      String thumbnailImageUrl});
}

/// @nodoc
class __$$_ShopSnippetCopyWithImpl<$Res>
    extends _$ShopSnippetCopyWithImpl<$Res, _$_ShopSnippet>
    implements _$$_ShopSnippetCopyWith<$Res> {
  __$$_ShopSnippetCopyWithImpl(
      _$_ShopSnippet _value, $Res Function(_$_ShopSnippet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shopId = null,
    Object? createdAt = null,
    Object? name = null,
    Object? position = null,
    Object? thumbnailImageUrl = null,
  }) {
    return _then(_$_ShopSnippet(
      shopId: null == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as GeoFirePoint,
      thumbnailImageUrl: null == thumbnailImageUrl
          ? _value.thumbnailImageUrl
          : thumbnailImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShopSnippet extends _ShopSnippet {
  const _$_ShopSnippet(
      {required this.shopId,
      @DateTimeConverter() required this.createdAt,
      required this.name,
      @GeoFirePointConverter() required this.position,
      required this.thumbnailImageUrl})
      : super._();

  factory _$_ShopSnippet.fromJson(Map<String, dynamic> json) =>
      _$$_ShopSnippetFromJson(json);

  @override
  final String shopId;
  @override
  @DateTimeConverter()
  final DateTime createdAt;
  @override
  final String name;
  @override
  @GeoFirePointConverter()
  final GeoFirePoint position;
  @override
  final String thumbnailImageUrl;

  @override
  String toString() {
    return 'ShopSnippet(shopId: $shopId, createdAt: $createdAt, name: $name, position: $position, thumbnailImageUrl: $thumbnailImageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShopSnippet &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.thumbnailImageUrl, thumbnailImageUrl) ||
                other.thumbnailImageUrl == thumbnailImageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, shopId, createdAt, name, position, thumbnailImageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShopSnippetCopyWith<_$_ShopSnippet> get copyWith =>
      __$$_ShopSnippetCopyWithImpl<_$_ShopSnippet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShopSnippetToJson(
      this,
    );
  }
}

abstract class _ShopSnippet extends ShopSnippet {
  const factory _ShopSnippet(
      {required final String shopId,
      @DateTimeConverter() required final DateTime createdAt,
      required final String name,
      @GeoFirePointConverter() required final GeoFirePoint position,
      required final String thumbnailImageUrl}) = _$_ShopSnippet;
  const _ShopSnippet._() : super._();

  factory _ShopSnippet.fromJson(Map<String, dynamic> json) =
      _$_ShopSnippet.fromJson;

  @override
  String get shopId;
  @override
  @DateTimeConverter()
  DateTime get createdAt;
  @override
  String get name;
  @override
  @GeoFirePointConverter()
  GeoFirePoint get position;
  @override
  String get thumbnailImageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_ShopSnippetCopyWith<_$_ShopSnippet> get copyWith =>
      throw _privateConstructorUsedError;
}
