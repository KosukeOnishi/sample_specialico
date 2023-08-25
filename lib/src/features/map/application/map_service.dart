import 'package:specialico/index.dart';

abstract class MapService {
  static Future<Position?> initCurrentPositionRepository(
      AsyncNotifierProviderRef ref) async {
    final positionStream = await GeolocatorClient.determinePosition();
    if (positionStream == null) {
      FirebaseAnalytics.instance
          .setUserProperty(name: 'position_enabled', value: 'false');
      ref.read(isPositionEnabledProvider.notifier).state = false;
      ref
          .read(currentPositionRepositoryProvider.notifier)
          .registerPosition(null);
    } else {
      FirebaseAnalytics.instance
          .setUserProperty(name: 'position_enabled', value: 'true');
      ref.read(isPositionEnabledProvider.notifier).state = true;
      positionStream.listen((position) => ref
          .read(currentPositionRepositoryProvider.notifier)
          .registerPosition(position));
    }
    return await positionStream?.first;
  }

  static Future<void> getMarkerSnippets(PlacesRepository placesRepo) async {
    await placesRepo.getSnippets();
  }

  static Future<Shop> getShop(String shopId, ShopRepository shopRepo) async {
    return await shopRepo.getShop(shopId);
  }

  static Future<void> requestLocationDialog() async {
    GeolocatorClient.requestPermission();
  }
}

final isPositionEnabledProvider = StateProvider<bool>((ref) => false);