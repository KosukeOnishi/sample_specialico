import 'package:specialico/index.dart';

part 'http_metadata_repository.g.dart';

@Riverpod(keepAlive: true)
class HttpMetadataRepository extends _$HttpMetadataRepository {
  @override
  Map<String, Metadata?> build() {
    debugPrint('metadata repo init');
    return <String, Metadata?>{};
  }

  void addHttpMetadataToRepo(String websiteUrl, Metadata? metadata) {
    state = {
      ...state,
      ...{websiteUrl: metadata}
    };
  }

  FutureOr<Metadata?> fetchMetadata(String websiteUrl) async {
    // すでにmetadataをfetchしているか確認する
    if (state.containsKey(websiteUrl)) {
      return state[websiteUrl];
    } else {
      Metadata? metadata;
      try {
        metadata = await MetadataFetch.extract(websiteUrl);
      } catch (e) {
        metadata = null;
      }
      addHttpMetadataToRepo(websiteUrl, metadata);
      return metadata;
    }
  }
}
