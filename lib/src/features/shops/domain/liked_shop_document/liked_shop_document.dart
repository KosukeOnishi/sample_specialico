import 'package:specialico/index.dart';

part 'liked_shop_document.freezed.dart';
part 'liked_shop_document.g.dart';

@freezed
class LikedShopDocument with _$LikedShopDocument {
  const LikedShopDocument._();
  const factory LikedShopDocument({
    required String likedShopId,
    @DateTimeConverter() required DateTime createdAt,
    @NullableDateTimeConverter() required DateTime? updatedAt,
    required String shopId,
    required String userId,
    @ShopSnippetConverter() required ShopSnippet shopSnippet,
  }) = _LikedShopDocument;

  factory LikedShopDocument.fromJson(Map<String, dynamic> json) => _$LikedShopDocumentFromJson(json);
}
