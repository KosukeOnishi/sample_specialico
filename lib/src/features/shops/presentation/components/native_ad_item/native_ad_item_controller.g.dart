// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'native_ad_item_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$nativeAdItemControllerHash() =>
    r'4e10a6086fe7111121f1c804ed4c37ba6e3c5187';

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

abstract class _$NativeAdItemController
    extends BuildlessAutoDisposeNotifier<NativeAdItemState> {
  late final AdWithView? adView;
  late final int index;
  late final BuildContext context;

  NativeAdItemState build(
    AdWithView? adView,
    int index,
    BuildContext context,
  );
}

/// See also [NativeAdItemController].
@ProviderFor(NativeAdItemController)
const nativeAdItemControllerProvider = NativeAdItemControllerFamily();

/// See also [NativeAdItemController].
class NativeAdItemControllerFamily extends Family<NativeAdItemState> {
  /// See also [NativeAdItemController].
  const NativeAdItemControllerFamily();

  /// See also [NativeAdItemController].
  NativeAdItemControllerProvider call(
    AdWithView? adView,
    int index,
    BuildContext context,
  ) {
    return NativeAdItemControllerProvider(
      adView,
      index,
      context,
    );
  }

  @override
  NativeAdItemControllerProvider getProviderOverride(
    covariant NativeAdItemControllerProvider provider,
  ) {
    return call(
      provider.adView,
      provider.index,
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
  String? get name => r'nativeAdItemControllerProvider';
}

/// See also [NativeAdItemController].
class NativeAdItemControllerProvider extends AutoDisposeNotifierProviderImpl<
    NativeAdItemController, NativeAdItemState> {
  /// See also [NativeAdItemController].
  NativeAdItemControllerProvider(
    this.adView,
    this.index,
    this.context,
  ) : super.internal(
          () => NativeAdItemController()
            ..adView = adView
            ..index = index
            ..context = context,
          from: nativeAdItemControllerProvider,
          name: r'nativeAdItemControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$nativeAdItemControllerHash,
          dependencies: NativeAdItemControllerFamily._dependencies,
          allTransitiveDependencies:
              NativeAdItemControllerFamily._allTransitiveDependencies,
        );

  final AdWithView? adView;
  final int index;
  final BuildContext context;

  @override
  bool operator ==(Object other) {
    return other is NativeAdItemControllerProvider &&
        other.adView == adView &&
        other.index == index &&
        other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, adView.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  NativeAdItemState runNotifierBuild(
    covariant NativeAdItemController notifier,
  ) {
    return notifier.build(
      adView,
      index,
      context,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
