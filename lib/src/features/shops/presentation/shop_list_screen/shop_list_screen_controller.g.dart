// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_list_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shouldShowGridSkeltonHash() =>
    r'681472851deeb15579e7bd97c0ae4e8dd44b4031';

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

typedef ShouldShowGridSkeltonRef = AutoDisposeProviderRef<bool>;

/// See also [shouldShowGridSkelton].
@ProviderFor(shouldShowGridSkelton)
const shouldShowGridSkeltonProvider = ShouldShowGridSkeltonFamily();

/// See also [shouldShowGridSkelton].
class ShouldShowGridSkeltonFamily extends Family<bool> {
  /// See also [shouldShowGridSkelton].
  const ShouldShowGridSkeltonFamily();

  /// See also [shouldShowGridSkelton].
  ShouldShowGridSkeltonProvider call(
    ScrollController controller,
    ShopListCategory category,
    Prefecture? prefecture,
    BuildContext context,
  ) {
    return ShouldShowGridSkeltonProvider(
      controller,
      category,
      prefecture,
      context,
    );
  }

  @override
  ShouldShowGridSkeltonProvider getProviderOverride(
    covariant ShouldShowGridSkeltonProvider provider,
  ) {
    return call(
      provider.controller,
      provider.category,
      provider.prefecture,
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
  String? get name => r'shouldShowGridSkeltonProvider';
}

/// See also [shouldShowGridSkelton].
class ShouldShowGridSkeltonProvider extends AutoDisposeProvider<bool> {
  /// See also [shouldShowGridSkelton].
  ShouldShowGridSkeltonProvider(
    this.controller,
    this.category,
    this.prefecture,
    this.context,
  ) : super.internal(
          (ref) => shouldShowGridSkelton(
            ref,
            controller,
            category,
            prefecture,
            context,
          ),
          from: shouldShowGridSkeltonProvider,
          name: r'shouldShowGridSkeltonProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$shouldShowGridSkeltonHash,
          dependencies: ShouldShowGridSkeltonFamily._dependencies,
          allTransitiveDependencies:
              ShouldShowGridSkeltonFamily._allTransitiveDependencies,
        );

  final ScrollController controller;
  final ShopListCategory category;
  final Prefecture? prefecture;
  final BuildContext context;

  @override
  bool operator ==(Object other) {
    return other is ShouldShowGridSkeltonProvider &&
        other.controller == controller &&
        other.category == category &&
        other.prefecture == prefecture &&
        other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, controller.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);
    hash = _SystemHash.combine(hash, prefecture.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$shopListScreenControllerHash() =>
    r'fbb4af24e58e4c64796a511af8828a96fe7ef59f';

abstract class _$ShopListScreenController
    extends BuildlessAutoDisposeNotifier<ShopListScreenState> {
  late final ScrollController controller;
  late final ShopListCategory category;
  late final Prefecture? prefecture;
  late final BuildContext context;

  ShopListScreenState build(
    ScrollController controller,
    ShopListCategory category,
    Prefecture? prefecture,
    BuildContext context,
  );
}

/// See also [ShopListScreenController].
@ProviderFor(ShopListScreenController)
const shopListScreenControllerProvider = ShopListScreenControllerFamily();

/// See also [ShopListScreenController].
class ShopListScreenControllerFamily extends Family<ShopListScreenState> {
  /// See also [ShopListScreenController].
  const ShopListScreenControllerFamily();

  /// See also [ShopListScreenController].
  ShopListScreenControllerProvider call(
    ScrollController controller,
    ShopListCategory category,
    Prefecture? prefecture,
    BuildContext context,
  ) {
    return ShopListScreenControllerProvider(
      controller,
      category,
      prefecture,
      context,
    );
  }

  @override
  ShopListScreenControllerProvider getProviderOverride(
    covariant ShopListScreenControllerProvider provider,
  ) {
    return call(
      provider.controller,
      provider.category,
      provider.prefecture,
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
  String? get name => r'shopListScreenControllerProvider';
}

/// See also [ShopListScreenController].
class ShopListScreenControllerProvider extends AutoDisposeNotifierProviderImpl<
    ShopListScreenController, ShopListScreenState> {
  /// See also [ShopListScreenController].
  ShopListScreenControllerProvider(
    this.controller,
    this.category,
    this.prefecture,
    this.context,
  ) : super.internal(
          () => ShopListScreenController()
            ..controller = controller
            ..category = category
            ..prefecture = prefecture
            ..context = context,
          from: shopListScreenControllerProvider,
          name: r'shopListScreenControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$shopListScreenControllerHash,
          dependencies: ShopListScreenControllerFamily._dependencies,
          allTransitiveDependencies:
              ShopListScreenControllerFamily._allTransitiveDependencies,
        );

  final ScrollController controller;
  final ShopListCategory category;
  final Prefecture? prefecture;
  final BuildContext context;

  @override
  bool operator ==(Object other) {
    return other is ShopListScreenControllerProvider &&
        other.controller == controller &&
        other.category == category &&
        other.prefecture == prefecture &&
        other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, controller.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);
    hash = _SystemHash.combine(hash, prefecture.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  ShopListScreenState runNotifierBuild(
    covariant ShopListScreenController notifier,
  ) {
    return notifier.build(
      controller,
      category,
      prefecture,
      context,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
