// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_snippet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShopSnippet _$$_ShopSnippetFromJson(Map<String, dynamic> json) =>
    _$_ShopSnippet(
      shopId: json['shopId'] as String,
      createdAt:
          const DateTimeConverter().fromJson(json['createdAt'] as Timestamp),
      name: json['name'] as String,
      position: const GeoFirePointConverter().fromJson(json['position'] as Map),
      thumbnailImageUrl: json['thumbnailImageUrl'] as String,
    );

Map<String, dynamic> _$$_ShopSnippetToJson(_$_ShopSnippet instance) =>
    <String, dynamic>{
      'shopId': instance.shopId,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'name': instance.name,
      'position': const GeoFirePointConverter().toJson(instance.position),
      'thumbnailImageUrl': instance.thumbnailImageUrl,
    };
