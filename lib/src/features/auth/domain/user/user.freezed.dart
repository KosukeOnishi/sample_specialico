// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _Shop.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get userId => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get likedShops => throw _privateConstructorUsedError;
  List<String> get shopSuggestCount => throw _privateConstructorUsedError;
  List<String> get shopReportCount => throw _privateConstructorUsedError;
  bool get isAnonymous => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String userId,
      @DateTimeConverter() DateTime createdAt,
      String name,
      List<String> likedShops,
      List<String> shopSuggestCount,
      List<String> shopReportCount,
      bool isAnonymous,
      String? profileImageUrl});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? createdAt = null,
    Object? name = null,
    Object? likedShops = null,
    Object? shopSuggestCount = null,
    Object? shopReportCount = null,
    Object? isAnonymous = null,
    Object? profileImageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      likedShops: null == likedShops
          ? _value.likedShops
          : likedShops // ignore: cast_nullable_to_non_nullable
              as List<String>,
      shopSuggestCount: null == shopSuggestCount
          ? _value.shopSuggestCount
          : shopSuggestCount // ignore: cast_nullable_to_non_nullable
              as List<String>,
      shopReportCount: null == shopReportCount
          ? _value.shopReportCount
          : shopReportCount // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isAnonymous: null == isAnonymous
          ? _value.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShopCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_ShopCopyWith(_$_Shop value, $Res Function(_$_Shop) then) =
      __$$_ShopCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      @DateTimeConverter() DateTime createdAt,
      String name,
      List<String> likedShops,
      List<String> shopSuggestCount,
      List<String> shopReportCount,
      bool isAnonymous,
      String? profileImageUrl});
}

/// @nodoc
class __$$_ShopCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_Shop>
    implements _$$_ShopCopyWith<$Res> {
  __$$_ShopCopyWithImpl(_$_Shop _value, $Res Function(_$_Shop) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? createdAt = null,
    Object? name = null,
    Object? likedShops = null,
    Object? shopSuggestCount = null,
    Object? shopReportCount = null,
    Object? isAnonymous = null,
    Object? profileImageUrl = freezed,
  }) {
    return _then(_$_Shop(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      likedShops: null == likedShops
          ? _value._likedShops
          : likedShops // ignore: cast_nullable_to_non_nullable
              as List<String>,
      shopSuggestCount: null == shopSuggestCount
          ? _value._shopSuggestCount
          : shopSuggestCount // ignore: cast_nullable_to_non_nullable
              as List<String>,
      shopReportCount: null == shopReportCount
          ? _value._shopReportCount
          : shopReportCount // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isAnonymous: null == isAnonymous
          ? _value.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Shop extends _Shop {
  const _$_Shop(
      {required this.userId,
      @DateTimeConverter() required this.createdAt,
      required this.name,
      required final List<String> likedShops,
      required final List<String> shopSuggestCount,
      required final List<String> shopReportCount,
      required this.isAnonymous,
      this.profileImageUrl})
      : _likedShops = likedShops,
        _shopSuggestCount = shopSuggestCount,
        _shopReportCount = shopReportCount,
        super._();

  factory _$_Shop.fromJson(Map<String, dynamic> json) => _$$_ShopFromJson(json);

  @override
  final String userId;
  @override
  @DateTimeConverter()
  final DateTime createdAt;
  @override
  final String name;
  final List<String> _likedShops;
  @override
  List<String> get likedShops {
    if (_likedShops is EqualUnmodifiableListView) return _likedShops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likedShops);
  }

  final List<String> _shopSuggestCount;
  @override
  List<String> get shopSuggestCount {
    if (_shopSuggestCount is EqualUnmodifiableListView)
      return _shopSuggestCount;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shopSuggestCount);
  }

  final List<String> _shopReportCount;
  @override
  List<String> get shopReportCount {
    if (_shopReportCount is EqualUnmodifiableListView) return _shopReportCount;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shopReportCount);
  }

  @override
  final bool isAnonymous;
  @override
  final String? profileImageUrl;

  @override
  String toString() {
    return 'User(userId: $userId, createdAt: $createdAt, name: $name, likedShops: $likedShops, shopSuggestCount: $shopSuggestCount, shopReportCount: $shopReportCount, isAnonymous: $isAnonymous, profileImageUrl: $profileImageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Shop &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._likedShops, _likedShops) &&
            const DeepCollectionEquality()
                .equals(other._shopSuggestCount, _shopSuggestCount) &&
            const DeepCollectionEquality()
                .equals(other._shopReportCount, _shopReportCount) &&
            (identical(other.isAnonymous, isAnonymous) ||
                other.isAnonymous == isAnonymous) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      createdAt,
      name,
      const DeepCollectionEquality().hash(_likedShops),
      const DeepCollectionEquality().hash(_shopSuggestCount),
      const DeepCollectionEquality().hash(_shopReportCount),
      isAnonymous,
      profileImageUrl);

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

abstract class _Shop extends User {
  const factory _Shop(
      {required final String userId,
      @DateTimeConverter() required final DateTime createdAt,
      required final String name,
      required final List<String> likedShops,
      required final List<String> shopSuggestCount,
      required final List<String> shopReportCount,
      required final bool isAnonymous,
      final String? profileImageUrl}) = _$_Shop;
  const _Shop._() : super._();

  factory _Shop.fromJson(Map<String, dynamic> json) = _$_Shop.fromJson;

  @override
  String get userId;
  @override
  @DateTimeConverter()
  DateTime get createdAt;
  @override
  String get name;
  @override
  List<String> get likedShops;
  @override
  List<String> get shopSuggestCount;
  @override
  List<String> get shopReportCount;
  @override
  bool get isAnonymous;
  @override
  String? get profileImageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_ShopCopyWith<_$_Shop> get copyWith => throw _privateConstructorUsedError;
}
