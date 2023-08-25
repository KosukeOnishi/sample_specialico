import 'package:specialico/index.dart';

part 'places_repository.g.dart';

@Riverpod(keepAlive: true)
class PlacesRepository extends _$PlacesRepository {
  @override
  List<Place> build() {
    return [];
  }

  void setPlaces(List<Place> places) {
    state = [...places];
  }

  Future<void> getSnippets() async {
    final snippetDoc = await MapDao.getSnippets();
    if (snippetDoc.isFromCache) {
      Map<String, Place> newPlacesMap = Map.fromIterables(
          snippetDoc.places.map((e) => e.shopId), snippetDoc.places);
      // cacheからchangelogを取ってから、cacheの最新のchangelogのあとに作成されたドキュメントを取得する
      final changelogsFromCache =
          await MapDao.getChangelogsFromCache(snippetDoc.updatedAt);
      DateTime startAfter = snippetDoc.updatedAt;
      if (changelogsFromCache.isNotEmpty) {
        startAfter = changelogsFromCache.last.createdAt;
        changelogsFromCache
            .map((log) => Place(
                shopId: log.shopId,
                name: log.name,
                latLng: LatLng(log.geoPoint.latitude, log.geoPoint.longitude)))
            .toList()
            .forEach((place) => newPlacesMap[place.shopId] = place);
      }

      final changeCount = await MapDao.getChangelogCounts(startAfter);
      if (changeCount == 0) {
        setPlaces(newPlacesMap.values.toList());
        return;
      }

      if (changeCount <= 20) {
        final changelogs = await MapDao.getChangelogs(snippetDoc.updatedAt);
        final changedPlaces = changelogs
            .map((log) => Place(
                shopId: log.shopId,
                name: log.name,
                latLng: LatLng(log.geoPoint.latitude, log.geoPoint.longitude)))
            .toList();
        for (Place changedPlace in changedPlaces) {
          newPlacesMap[changedPlace.shopId] = changedPlace;
        }
        setPlaces(newPlacesMap.values.toList());
      } else {
        final newSnippetDoc = await MapDao.getSnippets(true);
        setPlaces(newSnippetDoc.places);
      }
    } else {
      setPlaces(snippetDoc.places);
    }
  }
}
