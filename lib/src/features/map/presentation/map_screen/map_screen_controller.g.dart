// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shouldShowMapHash() => r'36d3b9d801626f10485c0930107540322e4d1628';

/// See also [shouldShowMap].
@ProviderFor(shouldShowMap)
final shouldShowMapProvider = AutoDisposeProvider<bool>.internal(
  shouldShowMap,
  name: r'shouldShowMapProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$shouldShowMapHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ShouldShowMapRef = AutoDisposeProviderRef<bool>;
String _$currentMarkerHash() => r'd510f974d06f8004baed6aa3e37daec7ff4e6967';

/// See also [currentMarker].
@ProviderFor(currentMarker)
final currentMarkerProvider = AutoDisposeProvider<Set<Marker>>.internal(
  currentMarker,
  name: r'currentMarkerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentMarkerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentMarkerRef = AutoDisposeProviderRef<Set<Marker>>;
String _$currentPlacesHash() => r'6921d6276a78e71502e1e68ce2160925e35cbd7e';

/// See also [currentPlaces].
@ProviderFor(currentPlaces)
final currentPlacesProvider =
    AutoDisposeProvider<Map<MarkerId, Place>>.internal(
  currentPlaces,
  name: r'currentPlacesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentPlacesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentPlacesRef = AutoDisposeProviderRef<Map<MarkerId, Place>>;
String _$shouldShowPagesHash() => r'7ee6b4304996389e85c2d2552b4785905326147e';

/// See also [shouldShowPages].
@ProviderFor(shouldShowPages)
final shouldShowPagesProvider = AutoDisposeProvider<bool>.internal(
  shouldShowPages,
  name: r'shouldShowPagesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$shouldShowPagesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ShouldShowPagesRef = AutoDisposeProviderRef<bool>;
String _$mapScreenControllerHash() =>
    r'ebdb02bd45fad7ce055d9af816a67b6878d231e7';

/// See also [MapScreenController].
@ProviderFor(MapScreenController)
final mapScreenControllerProvider =
    NotifierProvider<MapScreenController, MapScreenState>.internal(
  MapScreenController.new,
  name: r'mapScreenControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mapScreenControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MapScreenController = Notifier<MapScreenState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
