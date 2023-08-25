// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Shop _$$_ShopFromJson(Map<String, dynamic> json) => _$_Shop(
      shopId: json['shopId'] as String,
      placeId: json['placeId'] as String,
      createdAt:
          const DateTimeConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt: const NullableDateTimeConverter()
          .fromJson(json['updatedAt'] as Timestamp?),
      name: json['name'] as String,
      weekdayTexts: (json['weekdayTexts'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      weekdayTextsUpdatedAt: const NullableDateTimeConverter()
          .fromJson(json['weekdayTextsUpdatedAt'] as Timestamp?),
      weekdayTextsUpdatedBy:
          (json['weekdayTextsUpdatedBy'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      formattedAddress: json['formattedAddress'] as String,
      country: json['country'] as String,
      subRegions: (json['subRegions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      position: const GeoFirePointConverter().fromJson(json['position'] as Map),
      mapUrl: json['mapUrl'] as String,
      instagramPosts: json['instagramPosts'] == null
          ? const []
          : const InstagramPostsConverter()
              .fromJson(json['instagramPosts'] as List),
      instagramAccountUrl: json['instagramAccountUrl'] as String?,
      websiteUrl: json['websiteUrl'] as String?,
      likedCount: json['likedCount'] as int,
    );

Map<String, dynamic> _$$_ShopToJson(_$_Shop instance) => <String, dynamic>{
      'shopId': instance.shopId,
      'placeId': instance.placeId,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'updatedAt': const NullableDateTimeConverter().toJson(instance.updatedAt),
      'name': instance.name,
      'weekdayTexts': instance.weekdayTexts,
      'weekdayTextsUpdatedAt': const NullableDateTimeConverter()
          .toJson(instance.weekdayTextsUpdatedAt),
      'weekdayTextsUpdatedBy': instance.weekdayTextsUpdatedBy,
      'formattedAddress': instance.formattedAddress,
      'country': instance.country,
      'subRegions': instance.subRegions,
      'position': const GeoFirePointConverter().toJson(instance.position),
      'mapUrl': instance.mapUrl,
      'instagramPosts':
          const InstagramPostsConverter().toJson(instance.instagramPosts),
      'instagramAccountUrl': instance.instagramAccountUrl,
      'websiteUrl': instance.websiteUrl,
      'likedCount': instance.likedCount,
    };
