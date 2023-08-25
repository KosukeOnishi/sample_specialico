import 'package:specialico/index.dart';

class Place with ClusterItem {
  final String shopId;
  final String name;
  final LatLng latLng;

  Place({required this.shopId, required this.name, required this.latLng});

  @override
  LatLng get location => latLng;
}