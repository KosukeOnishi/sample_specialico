import 'package:specialico/index.dart';

class InstagramPost {
  const InstagramPost({
    required this.postUrl,
    required this.instagramUserId,
    required this.mediaId,
  });

  final String postUrl;
  final String instagramUserId;
  final String mediaId;

  factory InstagramPost.fromJson(dynamic json) {
    return InstagramPost(
      postUrl: json['postUrl'],
      instagramUserId: json['postData']['instagramUserId'],
      mediaId: json['postData']['mediaId'],
    );
  }
}

class InstagramPostsConverter
    implements JsonConverter<List<InstagramPost>, List<dynamic>> {
  const InstagramPostsConverter();

  @override
  List<InstagramPost> fromJson(List<dynamic> json) {
    return json.map((post) => InstagramPost.fromJson(post)).toList();
  }

  @override
  List<dynamic> toJson(List<InstagramPost> posts) {
    return posts
        .map((post) => Map.of({
              'postUrl': post.postUrl,
              'postData': Map.of({
                'instagramUserId': post.instagramUserId,
                'mediaId': post.mediaId,
              }),
            }))
        .toList();
  }
}
