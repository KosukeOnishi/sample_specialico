import 'package:specialico/index.dart';

part 'shop_snippet.freezed.dart';
part 'shop_snippet.g.dart';

@freezed
class ShopSnippet with _$ShopSnippet {
  const ShopSnippet._();
  const factory ShopSnippet({
    required String shopId,
    @DateTimeConverter() required DateTime createdAt,
    required String name,
    @GeoFirePointConverter() required GeoFirePoint position,
    required String thumbnailImageUrl,
  }) = _ShopSnippet;

  factory ShopSnippet.fromJson(Map<String, dynamic> json) => _$ShopSnippetFromJson(json);
}