// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_banner_ad_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mapBannerAdControllerHash() =>
    r'832dd3e03a0d29127881ab7660d216ae360f7759';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$MapBannerAdController
    extends BuildlessAutoDisposeNotifier<MapBannerAdState> {
  late final BuildContext context;

  MapBannerAdState build(
    BuildContext context,
  );
}

/// See also [MapBannerAdController].
@ProviderFor(MapBannerAdController)
const mapBannerAdControllerProvider = MapBannerAdControllerFamily();

/// See also [MapBannerAdController].
class MapBannerAdControllerFamily extends Family<MapBannerAdState> {
  /// See also [MapBannerAdController].
  const MapBannerAdControllerFamily();

  /// See also [MapBannerAdController].
  MapBannerAdControllerProvider call(
    BuildContext context,
  ) {
    return MapBannerAdControllerProvider(
      context,
    );
  }

  @override
  MapBannerAdControllerProvider getProviderOverride(
    covariant MapBannerAdControllerProvider provider,
  ) {
    return call(
      provider.context,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'mapBannerAdControllerProvider';
}

/// See also [MapBannerAdController].
class MapBannerAdControllerProvider extends AutoDisposeNotifierProviderImpl<
    MapBannerAdController, MapBannerAdState> {
  /// See also [MapBannerAdController].
  MapBannerAdControllerProvider(
    this.context,
  ) : super.internal(
          () => MapBannerAdController()..context = context,
          from: mapBannerAdControllerProvider,
          name: r'mapBannerAdControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mapBannerAdControllerHash,
          dependencies: MapBannerAdControllerFamily._dependencies,
          allTransitiveDependencies:
              MapBannerAdControllerFamily._allTransitiveDependencies,
        );

  final BuildContext context;

  @override
  bool operator ==(Object other) {
    return other is MapBannerAdControllerProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  MapBannerAdState runNotifierBuild(
    covariant MapBannerAdController notifier,
  ) {
    return notifier.build(
      context,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
