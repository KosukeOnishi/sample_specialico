// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Shop _$$_ShopFromJson(Map<String, dynamic> json) => _$_Shop(
      userId: json['userId'] as String,
      createdAt:
          const DateTimeConverter().fromJson(json['createdAt'] as Timestamp),
      name: json['name'] as String,
      likedShops: (json['likedShops'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      shopSuggestCount: (json['shopSuggestCount'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      shopReportCount: (json['shopReportCount'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      isAnonymous: json['isAnonymous'] as bool,
      profileImageUrl: json['profileImageUrl'] as String?,
    );

Map<String, dynamic> _$$_ShopToJson(_$_Shop instance) => <String, dynamic>{
      'userId': instance.userId,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'name': instance.name,
      'likedShops': instance.likedShops,
      'shopSuggestCount': instance.shopSuggestCount,
      'shopReportCount': instance.shopReportCount,
      'isAnonymous': instance.isAnonymous,
      'profileImageUrl': instance.profileImageUrl,
    };
