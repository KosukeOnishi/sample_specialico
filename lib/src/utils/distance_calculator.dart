import 'package:specialico/index.dart';

abstract class DistanceCalculator {
  /// Return value is distance (meter)
  static double calculateDistanceOfTwo(Position start, Position end) {
    return Geolocator.distanceBetween(
        start.latitude, start.longitude, end.latitude, end.longitude);
  }

  static double calculateDistanceOfPositionAndGeopoint(
      Position position, GeoPoint geopoint) {
    return Geolocator.distanceBetween(position.latitude, position.longitude,
            geopoint.latitude, geopoint.longitude) /
        1000;
  }

  static String getDistanceText(Position? position, GeoFirePoint point) {
    if (position == null) {
      return '';
    } else {
      final double distance = Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        point.latitude,
        point.longitude,
      );
      final distanceText = () {
        if (distance >= 1000) {
          return '${double.parse((distance / 1000).toStringAsFixed(1))}km  ';
        } else {
          return '${distance.round()}m  ';
        }
      }();
      return distanceText;
    }
  }
}
