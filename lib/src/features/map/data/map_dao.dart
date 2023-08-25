import 'package:specialico/index.dart';

class SnippetDoc {
  const SnippetDoc({
    required this.places,
    required this.isFromCache,
    required this.updatedAt,
  });

  final List<Place> places;
  final bool isFromCache;
  final DateTime updatedAt;
}

class Changelog {
  const Changelog({
    required this.shopId,
    required this.geoPoint,
    required this.name,
    required this.createdAt,
  });

  final String shopId;
  final GeoPoint geoPoint;
  final String name;
  final DateTime createdAt;
}

abstract class MapDao {
  static Future<SnippetDoc> getSnippets([bool forceFromSever = false]) async {
    debugPrint('\ngetSnippets called in map DAO!\n');
    DocumentSnapshot snapshot;
    bool isFromCache;
    if (forceFromSever) {
      snapshot = await FirebaseFirestore.instance
          .collection('places/v1/snippets_v1')
          .doc('snippets')
          .get(const GetOptions(source: Source.server));
      isFromCache = false;
      debugPrint('snippets from server');
    } else {
      try {
        snapshot = await FirebaseFirestore.instance
            .collection('places/v1/snippets_v1')
            .doc('snippets')
            .get(const GetOptions(source: Source.cache));
        isFromCache = true;
        debugPrint('snippets from cache');
      } catch (e) {
        snapshot = await FirebaseFirestore.instance
            .collection('places/v1/snippets_v1')
            .doc('snippets')
            .get(const GetOptions(source: Source.server));
        isFromCache = false;
        debugPrint('snippets from server');
      }
    }
    final Map<String, dynamic> placesData = (snapshot.data()! as Map)['places'];
    List<Place> places = [];
    for (MapEntry entry in placesData.entries) {
      final String shopId = entry.key;
      final GeoPoint geoPoint = entry.value[0] as GeoPoint;
      final String name = entry.value[1];
      places.add(Place(
        shopId: shopId,
        name: name,
        latLng: LatLng(geoPoint.latitude, geoPoint.longitude),
      ));
    }
    final DateTime updatedAt =
        ((snapshot.data()! as Map)['updatedAt'] as Timestamp).toDate();
    return SnippetDoc(
        places: places, isFromCache: isFromCache, updatedAt: updatedAt);
  }

  static Future<int> getChangelogCounts(DateTime updatedAt) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('places/v1/changelog_v1')
        .orderBy('createdAt')
        .startAfter([Timestamp.fromDate(updatedAt)])
        .count()
        .get();
    return snapshot.count;
  }

  static Future<List<Changelog>> getChangelogs(DateTime updatedAt) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('places/v1/changelog_v1')
        .orderBy('createdAt')
        .startAfter([Timestamp.fromDate(updatedAt)]).get();
    return snapshot.docs.map((doc) {
      var data = doc.data();
      return Changelog(
        shopId: data['shopId'],
        geoPoint: data['place']['geopoint'],
        name: data['place']['name'],
        createdAt: (data['createdAt'] as Timestamp).toDate(),
      );
    }).toList();
  }

  static Future<List<Changelog>> getChangelogsFromCache(
      DateTime updatedAt) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('places/v1/changelog_v1')
          .orderBy('createdAt')
          .startAfter([Timestamp.fromDate(updatedAt)]).get(
              const GetOptions(source: Source.cache));
      return snapshot.docs.map((doc) {
        var data = doc.data();
        return Changelog(
          shopId: data['shopId'],
          geoPoint: data['place']['geopoint'],
          name: data['place']['name'],
          createdAt: (data['createdAt'] as Timestamp).toDate(),
        );
      }).toList();
    } catch (e) {
      return [];
    }
  }
}
