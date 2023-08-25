import 'package:specialico/index.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();
  const factory User({
    required String userId,
    @DateTimeConverter() required DateTime createdAt,
    required String name,
    required List<String> likedShops,
    required List<String> shopSuggestCount,
    required List<String> shopReportCount,
    required bool isAnonymous,
    String? profileImageUrl,
  }) = _Shop;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
