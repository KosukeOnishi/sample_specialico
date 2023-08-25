import 'package:flutter/scheduler.dart';
import 'package:specialico/index.dart';

// singleton
class AnalyticsClient {
  static final AnalyticsClient _instance = AnalyticsClient._internal();

  factory AnalyticsClient() {
    return _instance;
  }

  AnalyticsClient._internal();

  String? currentScreen;

  Future<void> init(String? userId, bool isAnonymous) async {
    await FirebaseAnalytics.instance.setUserId(id: userId);
    await FirebaseAnalytics.instance
        .setUserProperty(name: 'is_anonymous', value: isAnonymous.toString());
    final brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    final defaultParams = await _initDefaultParams(brightness);
    await FirebaseAnalytics.instance.setDefaultEventParameters(defaultParams);
    FirebaseAnalytics.instance.logAppOpen();
  }

  Future<void> reInit(String userId, bool isAnonymous) async {
    await FirebaseAnalytics.instance.setUserId(id: userId);
    await FirebaseAnalytics.instance
        .setUserProperty(name: 'is_anonymous', value: isAnonymous.toString());
  }

  Future<Map<String, Object?>> _initDefaultParams(Brightness brightness) async {
    final prefs = await SharedPreferences.getInstance();
    late int openCount;
    if (prefs.containsKey('open_count')) {
      openCount = prefs.getInt('open_count')! + 1;
    } else {
      openCount = 1;
    }

    prefs.setInt('open_count', openCount);

    return {
      'brightness': brightness.toString().split('.').last,
      'open_count': openCount,
    };
  }

  void setScreen(String? path) {
    if (path == null) return;

    final topLocation = path.split('/').last;
    switch (topLocation) {
      case 'home':
        FirebaseAnalytics.instance.setCurrentScreen(screenName: 'home');
        currentScreen = 'home';
        break;
      case 'map':
        FirebaseAnalytics.instance.setCurrentScreen(screenName: 'map');
        currentScreen = 'map';
        break;
      case 'option':
        FirebaseAnalytics.instance.setCurrentScreen(screenName: 'option');
        currentScreen = 'option';
        break;
      case 'profile_edit':
        FirebaseAnalytics.instance.setCurrentScreen(screenName: 'profile_edit');
        currentScreen = 'profile_edit';
        break;
      case 'terms_of_service':
        FirebaseAnalytics.instance
            .setCurrentScreen(screenName: 'terms_of_service');
        currentScreen = 'terms_of_service';
        break;
      case 'privacy_policy':
        FirebaseAnalytics.instance
            .setCurrentScreen(screenName: 'privacy_policy');
        currentScreen = 'privacy_policy';
        break;
      case 'area':
        FirebaseAnalytics.instance.setCurrentScreen(screenName: 'area');
        currentScreen = 'area';
        break;
      case 'latest':
        FirebaseAnalytics.instance.setCurrentScreen(screenName: 'latest');
        currentScreen = 'latest';
        break;
      case 'like':
        FirebaseAnalytics.instance.setCurrentScreen(screenName: 'like');
        currentScreen = 'like';
        break;
      case 'suggest':
        FirebaseAnalytics.instance.setCurrentScreen(screenName: 'suggest');
        currentScreen = 'suggest';
        break;
      default:
        if (topLocation.contains('detail')) {
          FirebaseAnalytics.instance.setCurrentScreen(screenName: 'detail');
          currentScreen = 'detail';
        } else if (topLocation.contains('location')) {
          FirebaseAnalytics.instance.setCurrentScreen(screenName: 'location');
          currentScreen = 'location';
        }
    }
  }

  Future<void> logEvent(LogEvent event, Map<String, Object?>? params) {
    var temp = {...(params ?? {})};
    if (currentScreen != null) temp['current_screen'] = currentScreen;
    for (MapEntry entry in params?.entries.toList() ?? []) {
      if (entry.value.runtimeType == bool) {
        debugPrint('bool to string');
        temp[entry.key] = entry.value.toString();
      }
    }
    return FirebaseAnalytics.instance
        .logEvent(name: event.getEventName(), parameters: temp);
  }

  static Map<String, Object?> getShopParams({
    required ShopSnippet shopSnippet,
    required List<String> likedIds,
    required Position? position,
  }) {
    Map<String, Object> params = {
      'shop_Id': shopSnippet.shopId,
      'longitude': shopSnippet.position.longitude,
      'latitude': shopSnippet.position.latitude,
      'shop_name': shopSnippet.name,
      'is_liked_by_user': likedIds.contains(shopSnippet.shopId),
    };
    if (position != null) {
      params['distance_in_km'] =
          DistanceCalculator.calculateDistanceOfPositionAndGeopoint(
              position, shopSnippet.position.geopoint);
    }
    return params;
  }
}
