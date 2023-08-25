// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_detail_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shopDetailScreenControllerHash() =>
    r'd5a94cb361a48004e1b0ae894ce59f160cd867de';

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

abstract class _$ShopDetailScreenController
    extends BuildlessAutoDisposeNotifier<PageController> {
  late final int index;

  PageController build(
    int index,
  );
}

/// See also [ShopDetailScreenController].
@ProviderFor(ShopDetailScreenController)
const shopDetailScreenControllerProvider = ShopDetailScreenControllerFamily();

/// See also [ShopDetailScreenController].
class ShopDetailScreenControllerFamily extends Family<PageController> {
  /// See also [ShopDetailScreenController].
  const ShopDetailScreenControllerFamily();

  /// See also [ShopDetailScreenController].
  ShopDetailScreenControllerProvider call(
    int index,
  ) {
    return ShopDetailScreenControllerProvider(
      index,
    );
  }

  @override
  ShopDetailScreenControllerProvider getProviderOverride(
    covariant ShopDetailScreenControllerProvider provider,
  ) {
    return call(
      provider.index,
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
  String? get name => r'shopDetailScreenControllerProvider';
}

/// See also [ShopDetailScreenController].
class ShopDetailScreenControllerProvider
    extends AutoDisposeNotifierProviderImpl<ShopDetailScreenController,
        PageController> {
  /// See also [ShopDetailScreenController].
  ShopDetailScreenControllerProvider(
    this.index,
  ) : super.internal(
          () => ShopDetailScreenController()..index = index,
          from: shopDetailScreenControllerProvider,
          name: r'shopDetailScreenControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$shopDetailScreenControllerHash,
          dependencies: ShopDetailScreenControllerFamily._dependencies,
          allTransitiveDependencies:
              ShopDetailScreenControllerFamily._allTransitiveDependencies,
        );

  final int index;

  @override
  bool operator ==(Object other) {
    return other is ShopDetailScreenControllerProvider && other.index == index;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  PageController runNotifierBuild(
    covariant ShopDetailScreenController notifier,
  ) {
    return notifier.build(
      index,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
