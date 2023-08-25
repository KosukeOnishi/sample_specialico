// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_detail_page_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shopDetailPageControllerHash() =>
    r'd8fcab144f4c4d4a5049603810c97dfcbd21ea7b';

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

abstract class _$ShopDetailPageController
    extends BuildlessNotifier<ShopDetailPageState> {
  late final String shopId;
  late final ShopListCategory category;

  ShopDetailPageState build(
    String shopId,
    ShopListCategory category,
  );
}

/// See also [ShopDetailPageController].
@ProviderFor(ShopDetailPageController)
const shopDetailPageControllerProvider = ShopDetailPageControllerFamily();

/// See also [ShopDetailPageController].
class ShopDetailPageControllerFamily extends Family<ShopDetailPageState> {
  /// See also [ShopDetailPageController].
  const ShopDetailPageControllerFamily();

  /// See also [ShopDetailPageController].
  ShopDetailPageControllerProvider call(
    String shopId,
    ShopListCategory category,
  ) {
    return ShopDetailPageControllerProvider(
      shopId,
      category,
    );
  }

  @override
  ShopDetailPageControllerProvider getProviderOverride(
    covariant ShopDetailPageControllerProvider provider,
  ) {
    return call(
      provider.shopId,
      provider.category,
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
  String? get name => r'shopDetailPageControllerProvider';
}

/// See also [ShopDetailPageController].
class ShopDetailPageControllerProvider extends NotifierProviderImpl<
    ShopDetailPageController, ShopDetailPageState> {
  /// See also [ShopDetailPageController].
  ShopDetailPageControllerProvider(
    this.shopId,
    this.category,
  ) : super.internal(
          () => ShopDetailPageController()
            ..shopId = shopId
            ..category = category,
          from: shopDetailPageControllerProvider,
          name: r'shopDetailPageControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$shopDetailPageControllerHash,
          dependencies: ShopDetailPageControllerFamily._dependencies,
          allTransitiveDependencies:
              ShopDetailPageControllerFamily._allTransitiveDependencies,
        );

  final String shopId;
  final ShopListCategory category;

  @override
  bool operator ==(Object other) {
    return other is ShopDetailPageControllerProvider &&
        other.shopId == shopId &&
        other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, shopId.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  ShopDetailPageState runNotifierBuild(
    covariant ShopDetailPageController notifier,
  ) {
    return notifier.build(
      shopId,
      category,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
