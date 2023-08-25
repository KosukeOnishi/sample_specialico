// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shopSnippetsOfCategoryHash() =>
    r'4828001a107ce461c24173534fd490f69ee3e289';

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

typedef ShopSnippetsOfCategoryRef = AutoDisposeProviderRef<List<ShopSnippet>>;

/// See also [shopSnippetsOfCategory].
@ProviderFor(shopSnippetsOfCategory)
const shopSnippetsOfCategoryProvider = ShopSnippetsOfCategoryFamily();

/// See also [shopSnippetsOfCategory].
class ShopSnippetsOfCategoryFamily extends Family<List<ShopSnippet>> {
  /// See also [shopSnippetsOfCategory].
  const ShopSnippetsOfCategoryFamily();

  /// See also [shopSnippetsOfCategory].
  ShopSnippetsOfCategoryProvider call(
    ShopListCategory category,
  ) {
    return ShopSnippetsOfCategoryProvider(
      category,
    );
  }

  @override
  ShopSnippetsOfCategoryProvider getProviderOverride(
    covariant ShopSnippetsOfCategoryProvider provider,
  ) {
    return call(
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
  String? get name => r'shopSnippetsOfCategoryProvider';
}

/// See also [shopSnippetsOfCategory].
class ShopSnippetsOfCategoryProvider
    extends AutoDisposeProvider<List<ShopSnippet>> {
  /// See also [shopSnippetsOfCategory].
  ShopSnippetsOfCategoryProvider(
    this.category,
  ) : super.internal(
          (ref) => shopSnippetsOfCategory(
            ref,
            category,
          ),
          from: shopSnippetsOfCategoryProvider,
          name: r'shopSnippetsOfCategoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$shopSnippetsOfCategoryHash,
          dependencies: ShopSnippetsOfCategoryFamily._dependencies,
          allTransitiveDependencies:
              ShopSnippetsOfCategoryFamily._allTransitiveDependencies,
        );

  final ShopListCategory category;

  @override
  bool operator ==(Object other) {
    return other is ShopSnippetsOfCategoryProvider &&
        other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$shopSnippetOfShopIdHash() =>
    r'ab4eff13c993796aa350a01b0cefa6b4ba8e7b42';
typedef ShopSnippetOfShopIdRef = AutoDisposeProviderRef<ShopSnippet>;

/// See also [shopSnippetOfShopId].
@ProviderFor(shopSnippetOfShopId)
const shopSnippetOfShopIdProvider = ShopSnippetOfShopIdFamily();

/// See also [shopSnippetOfShopId].
class ShopSnippetOfShopIdFamily extends Family<ShopSnippet> {
  /// See also [shopSnippetOfShopId].
  const ShopSnippetOfShopIdFamily();

  /// See also [shopSnippetOfShopId].
  ShopSnippetOfShopIdProvider call(
    String shopId,
  ) {
    return ShopSnippetOfShopIdProvider(
      shopId,
    );
  }

  @override
  ShopSnippetOfShopIdProvider getProviderOverride(
    covariant ShopSnippetOfShopIdProvider provider,
  ) {
    return call(
      provider.shopId,
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
  String? get name => r'shopSnippetOfShopIdProvider';
}

/// See also [shopSnippetOfShopId].
class ShopSnippetOfShopIdProvider extends AutoDisposeProvider<ShopSnippet> {
  /// See also [shopSnippetOfShopId].
  ShopSnippetOfShopIdProvider(
    this.shopId,
  ) : super.internal(
          (ref) => shopSnippetOfShopId(
            ref,
            shopId,
          ),
          from: shopSnippetOfShopIdProvider,
          name: r'shopSnippetOfShopIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$shopSnippetOfShopIdHash,
          dependencies: ShopSnippetOfShopIdFamily._dependencies,
          allTransitiveDependencies:
              ShopSnippetOfShopIdFamily._allTransitiveDependencies,
        );

  final String shopId;

  @override
  bool operator ==(Object other) {
    return other is ShopSnippetOfShopIdProvider && other.shopId == shopId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, shopId.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$shopOfShopIdHash() => r'343b3a0edcded5c0a93bc18a26a69608a590fc51';
typedef ShopOfShopIdRef = AutoDisposeProviderRef<Shop?>;

/// See also [shopOfShopId].
@ProviderFor(shopOfShopId)
const shopOfShopIdProvider = ShopOfShopIdFamily();

/// See also [shopOfShopId].
class ShopOfShopIdFamily extends Family<Shop?> {
  /// See also [shopOfShopId].
  const ShopOfShopIdFamily();

  /// See also [shopOfShopId].
  ShopOfShopIdProvider call(
    String shopId,
  ) {
    return ShopOfShopIdProvider(
      shopId,
    );
  }

  @override
  ShopOfShopIdProvider getProviderOverride(
    covariant ShopOfShopIdProvider provider,
  ) {
    return call(
      provider.shopId,
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
  String? get name => r'shopOfShopIdProvider';
}

/// See also [shopOfShopId].
class ShopOfShopIdProvider extends AutoDisposeProvider<Shop?> {
  /// See also [shopOfShopId].
  ShopOfShopIdProvider(
    this.shopId,
  ) : super.internal(
          (ref) => shopOfShopId(
            ref,
            shopId,
          ),
          from: shopOfShopIdProvider,
          name: r'shopOfShopIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$shopOfShopIdHash,
          dependencies: ShopOfShopIdFamily._dependencies,
          allTransitiveDependencies:
              ShopOfShopIdFamily._allTransitiveDependencies,
        );

  final String shopId;

  @override
  bool operator ==(Object other) {
    return other is ShopOfShopIdProvider && other.shopId == shopId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, shopId.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$metadataOfShopHash() => r'86e0385fb951e69973deeb17e91eb19720dd2737';
typedef MetadataOfShopRef = AutoDisposeFutureProviderRef<Metadata?>;

/// See also [metadataOfShop].
@ProviderFor(metadataOfShop)
const metadataOfShopProvider = MetadataOfShopFamily();

/// See also [metadataOfShop].
class MetadataOfShopFamily extends Family<AsyncValue<Metadata?>> {
  /// See also [metadataOfShop].
  const MetadataOfShopFamily();

  /// See also [metadataOfShop].
  MetadataOfShopProvider call(
    Shop shop,
  ) {
    return MetadataOfShopProvider(
      shop,
    );
  }

  @override
  MetadataOfShopProvider getProviderOverride(
    covariant MetadataOfShopProvider provider,
  ) {
    return call(
      provider.shop,
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
  String? get name => r'metadataOfShopProvider';
}

/// See also [metadataOfShop].
class MetadataOfShopProvider extends AutoDisposeFutureProvider<Metadata?> {
  /// See also [metadataOfShop].
  MetadataOfShopProvider(
    this.shop,
  ) : super.internal(
          (ref) => metadataOfShop(
            ref,
            shop,
          ),
          from: metadataOfShopProvider,
          name: r'metadataOfShopProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$metadataOfShopHash,
          dependencies: MetadataOfShopFamily._dependencies,
          allTransitiveDependencies:
              MetadataOfShopFamily._allTransitiveDependencies,
        );

  final Shop shop;

  @override
  bool operator ==(Object other) {
    return other is MetadataOfShopProvider && other.shop == shop;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, shop.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
