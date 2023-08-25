import 'package:specialico/index.dart';

class GeoFirePointConverter implements JsonConverter<GeoFirePoint, Map> {
  const GeoFirePointConverter();

  @override
  GeoFirePoint fromJson(Map json) {
    final GeoPoint geoPoint = json['geopoint'] as GeoPoint;
    return GeoFirePoint(geoPoint);
  }

  @override
  Map toJson(GeoFirePoint point) {
    Map data = Map.of({
      'geopoint': point.geopoint,
      'geohash': point.geohash,
    });
    return data;
  }
}