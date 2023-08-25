import 'package:specialico/index.dart';

class JsonCacheManager extends CacheManager with ImageCacheManager {
  static const key = 'libCachedImageData';

  static final JsonCacheManager _instance = JsonCacheManager._();
  factory JsonCacheManager() {
    return _instance;
  }

  JsonCacheManager._()
      : super(
          Config(
            key,
            repo: JsonCacheInfoRepository(),
          ),
        );
}