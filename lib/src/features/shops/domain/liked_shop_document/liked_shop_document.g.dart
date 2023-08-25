// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liked_shop_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LikedShopDocument _$$_LikedShopDocumentFromJson(Map<String, dynamic> json) =>
    _$_LikedShopDocument(
      likedShopId: json['likedShopId'] as String,
      createdAt:
          const DateTimeConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt: const NullableDateTimeConverter()
          .fromJson(json['updatedAt'] as Timestamp?),
      shopId: json['shopId'] as String,
      userId: json['userId'] as String,
      shopSnippet: const ShopSnippetConverter()
          .fromJson(json['shopSnippet'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LikedShopDocumentToJson(
        _$_LikedShopDocument instance) =>
    <String, dynamic>{
      'likedShopId': instance.likedShopId,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'updatedAt': const NullableDateTimeConverter().toJson(instance.updatedAt),
      'shopId': instance.shopId,
      'userId': instance.userId,
      'shopSnippet': const ShopSnippetConverter().toJson(instance.shopSnippet),
    };
