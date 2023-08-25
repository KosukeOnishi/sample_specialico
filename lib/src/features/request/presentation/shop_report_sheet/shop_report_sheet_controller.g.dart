// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_report_sheet_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shopReportSheetControllerHash() =>
    r'b2bd78bb10d9deb6afe93c92f41b94bbc66439c2';

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

abstract class _$ShopReportSheetController
    extends BuildlessAutoDisposeNotifier<ShopReportSheetState> {
  late final Shop shop;
  late final TextEditingController controller;

  ShopReportSheetState build(
    Shop shop,
    TextEditingController controller,
  );
}

/// See also [ShopReportSheetController].
@ProviderFor(ShopReportSheetController)
const shopReportSheetControllerProvider = ShopReportSheetControllerFamily();

/// See also [ShopReportSheetController].
class ShopReportSheetControllerFamily extends Family<ShopReportSheetState> {
  /// See also [ShopReportSheetController].
  const ShopReportSheetControllerFamily();

  /// See also [ShopReportSheetController].
  ShopReportSheetControllerProvider call(
    Shop shop,
    TextEditingController controller,
  ) {
    return ShopReportSheetControllerProvider(
      shop,
      controller,
    );
  }

  @override
  ShopReportSheetControllerProvider getProviderOverride(
    covariant ShopReportSheetControllerProvider provider,
  ) {
    return call(
      provider.shop,
      provider.controller,
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
  String? get name => r'shopReportSheetControllerProvider';
}

/// See also [ShopReportSheetController].
class ShopReportSheetControllerProvider extends AutoDisposeNotifierProviderImpl<
    ShopReportSheetController, ShopReportSheetState> {
  /// See also [ShopReportSheetController].
  ShopReportSheetControllerProvider(
    this.shop,
    this.controller,
  ) : super.internal(
          () => ShopReportSheetController()
            ..shop = shop
            ..controller = controller,
          from: shopReportSheetControllerProvider,
          name: r'shopReportSheetControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$shopReportSheetControllerHash,
          dependencies: ShopReportSheetControllerFamily._dependencies,
          allTransitiveDependencies:
              ShopReportSheetControllerFamily._allTransitiveDependencies,
        );

  final Shop shop;
  final TextEditingController controller;

  @override
  bool operator ==(Object other) {
    return other is ShopReportSheetControllerProvider &&
        other.shop == shop &&
        other.controller == controller;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, shop.hashCode);
    hash = _SystemHash.combine(hash, controller.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  ShopReportSheetState runNotifierBuild(
    covariant ShopReportSheetController notifier,
  ) {
    return notifier.build(
      shop,
      controller,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
