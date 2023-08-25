# Firestoreデータベース構成
[参考ーCloud Firestoreを実践投入するにあたって考えたこと
](https://qiita.com/1amageek/items/d606dcee9fbcf21eeec6)
## 構成
- public (collection)
    - v1 (doc)
        - public_users_v1 (sub collection)
            - user (doc)
        - public_liked_shops_v1 (sub collection)
            - liked_shop (doc)
        - public_visited_shops_v1 (sub collection) (not yet)
            - visited_shop (doc)
        - public_favorite_shops_v1 (sub collection) (not yet)
            - favorite_shop (doc)
        - delete_users_v1 (sub collection)
            - delete_user
- shops (collection)
    - v1 (doc)
        - shops_v1 (sub collection)
            - shop (doc)
        - brands_v1 (sub collection)
            - brand (doc)
                - brand_shops_v1 (sub collection)
                    - brand_shop (doc)
    - shop_count (doc)
- places (collection)
    - v1 (doc)
        - snippets_v1 (sub collection)
            - snippets (doc)
        - changelog_v1 (sub collection)
            - changelog (doc)
- requests (collection)
    - v1 (doc)
        - shop_suggest_v1 (sub collection)
            - shop_suggest (doc)
        - shop_report_v1 (sub collection)
            - shop_report (doc)
- configure (collection)
    - info (doc)

## ドキュメント定義
一行目は、documentのid。

### version
```dart
String versionId, // (v1, v2, v3....)
Timestamp createdAt,
Timestamp? updatedAt,
Bool isActive,
Bool isLatest,
```

### user
```dart
String userId, // also in the doc field
Timestamp createdAt,
Timestamp? updatedAt,
bool isAnonymous,
String name,
Array<String> likedShops, // いいねしたショップのshopIdリスト
Array<String> visitedShopCount, // not yet
Array<String> favoriteShopCount, // not yet
String? profileImageUrl,
```

### delete_user
```dart
String deleteUserId
String userId,
Timestamp createdAt,
```

### liked_shop
```dart
String likedShopId,
Timestamp createdAt,
Timestamp? updatedAt,
String userId,
String shopId,
Map<String, Value> shopSnippet,
    String shopId,
    Timestamp createdAt,
    Timestamp? updatedAt,
    String name,
    Map position,
        Geopoint geopoint,
        String geohash,
    String thumbnailImageUrl,
```

<!-- ### visited_shop
```dart
String id,
Timestamp createdAt,
Timestamp? updatedAt,
```

### favorite_shop
```dart
String id,
Timestamp createdAt,
Timestamp? updatedAt,
``` -->

### shop_count
```dart
Num count, // 全国のshopCount
Map<String, Num> countsOfEachPrefecture,
    String prefecture: Num count,
Timestamp createdAt,
Timestamp updatedAt,
```

### shop
```dart
String shopId, // also in the doc field
String? brandId,
String placeId,
Timestamp createdAt,
Timestamp? updatedAt,
String name,
Array<String> weekdayTexts,
Map<String, String>? weekdayTextsUpdatedBy,
    String userId,
    String userName,
Timestamp? weekdayTextsUpdatedAt,
String formattedAddress,
String country,
Array<String> subRegions, // e.g. ['Tokyo', 'Tokyo_ShibuyaCity', 'Tokyo_ShibuyaCity_Tomigaya']
Map position,
    Geopoint geopoint,
    String geohash,
String mapUrl,
Array<Map<String, dynamic>> instagramPosts,
    Map<String, dynamic> instagramPost,
        String postUrl,
        Map<String, String> postData,
            String instagramUserId,
            String mediaId,
String? instagramAccountUrl,
String? websiteUrl,
Num likedCount,
Timestamp? likedCountUpdatedAt,
Num visitedCount, // Not yet
Num favoriteCount, // Not yet
```

### brand
```dart
String brandId, // also in the doc field
Timestamp createdAt,
Timestamp? updatedAt,
String name,
Array<String> captions,
String websiteUrl,
String brandImageUrl,
Num shopCount,
Num likedUserCount, (not yet)
```

### brand_shop
```dart
String brandShopId,
Timestamp createdAt,
Timestamp? updatedAt,
String shopId,
String brandId,
Map<String, Value> shopSnippet,
    String shopId,
    Timestamp createdAt,
    Timestamp? updatedAt,
    String name,
    Map position,
        Geopoint geopoint,
        String geohash,
    String thumbnailImageUrl,
```

### snippets
```dart
String country,
Timestamp updatedAt,
Map<String, Array> places,
    String shopId: [GeoPoint geopoint, String name],
```

### changelog
```dart
String changelogId,
String country,
Timestamp createdAt,
String shopId,
// placeがnullのときは削除、それ以外のときはidに対応するplaceを更新
Map<String, dynamic>? place,
    GeoPoint geopoint,
    String name,
```

### shop_suggest
```dart
String shopSuggestId, // also in the doc field
Timestamp createdAt,
Timestamp? updatedAt,
String userId,
String userName,
String mapUrl,
String shopName,
Bool isChecked,
Bool isPassed,
```

### shop_report
```dart
String shopReportId, // also in the doc field
Timestamp createdAt,
Timestamp? updatedAt,
String userId,
String userName,
String shopId,
String shopName,
Map contents,
    Bool wrongShopName,
    Bool wrongAddress,
    Bool wrongPosition,
    Bool wrongBrand,
    Bool invalidMapUrl,
    Bool invalidShopImages,
    Bool invalidInstagramAccount,
    Bool invalidWebsiteUrl,
    Bool notSpecialtyCoffee,
    Bool notCoffeeShop,
    Bool otherProblems,
String? comment,
Bool isChecked,
Bool isPassed,
```

### info
```dart
String infoId,
Timestamp createdAt,
String version,
Bool isEnabled,
```
