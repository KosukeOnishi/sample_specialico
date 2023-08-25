import 'package:specialico/index.dart';

class ShopSnippetConverter
    implements JsonConverter<ShopSnippet, Map<String, dynamic>> {
  const ShopSnippetConverter();

  @override
  ShopSnippet fromJson(Map<String, dynamic> json) {
    return ShopSnippet.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(ShopSnippet snippet) {
    return snippet.toJson();
  }
}
