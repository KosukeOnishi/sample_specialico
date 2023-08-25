import 'package:specialico/index.dart';

part 'shop.freezed.dart';
part 'shop.g.dart';

@freezed
class Shop with _$Shop {
  const Shop._();
  const factory Shop({
    required String shopId,
    required String placeId,
    @DateTimeConverter() required DateTime createdAt,
    @NullableDateTimeConverter() required DateTime? updatedAt,
    required String name,
    @Default([]) List<String> weekdayTexts,
    @NullableDateTimeConverter() DateTime? weekdayTextsUpdatedAt,
    Map<String, String>? weekdayTextsUpdatedBy,
    required String formattedAddress,
    required String country,
    @Default([]) List<String> subRegions,
    @GeoFirePointConverter() required GeoFirePoint position,
    required String mapUrl,
    @Default([]) @InstagramPostsConverter() List<InstagramPost> instagramPosts,
    String? instagramAccountUrl,
    String? websiteUrl,
    required int likedCount,
  }) = _Shop;

  factory Shop.fromJson(Map<String, dynamic> json) => _$ShopFromJson(json);

  ShopSnippet getShopSnippet() {
    return ShopSnippet(
      shopId: shopId,
      createdAt: createdAt,
      name: name,
      position: position,
      thumbnailImageUrl: '${instagramPosts.first.postUrl.split('?')[0]}media/?size=l',
    );
  }
}
