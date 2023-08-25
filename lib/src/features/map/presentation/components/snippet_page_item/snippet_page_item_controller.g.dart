// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snippet_page_item_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$snippetPageItemControllerHash() =>
    r'736c1d8abdd828e668cc3b5f33f45e5b76c2ce84';

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

abstract class _$SnippetPageItemController
    extends BuildlessAutoDisposeNotifier<SnippetPageItemState> {
  late final String shopId;

  SnippetPageItemState build(
    String shopId,
  );
}

/// See also [SnippetPageItemController].
@ProviderFor(SnippetPageItemController)
const snippetPageItemControllerProvider = SnippetPageItemControllerFamily();

/// See also [SnippetPageItemController].
class SnippetPageItemControllerFamily extends Family<SnippetPageItemState> {
  /// See also [SnippetPageItemController].
  const SnippetPageItemControllerFamily();

  /// See also [SnippetPageItemController].
  SnippetPageItemControllerProvider call(
    String shopId,
  ) {
    return SnippetPageItemControllerProvider(
      shopId,
    );
  }

  @override
  SnippetPageItemControllerProvider getProviderOverride(
    covariant SnippetPageItemControllerProvider provider,
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
  String? get name => r'snippetPageItemControllerProvider';
}

/// See also [SnippetPageItemController].
class SnippetPageItemControllerProvider extends AutoDisposeNotifierProviderImpl<
    SnippetPageItemController, SnippetPageItemState> {
  /// See also [SnippetPageItemController].
  SnippetPageItemControllerProvider(
    this.shopId,
  ) : super.internal(
          () => SnippetPageItemController()..shopId = shopId,
          from: snippetPageItemControllerProvider,
          name: r'snippetPageItemControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$snippetPageItemControllerHash,
          dependencies: SnippetPageItemControllerFamily._dependencies,
          allTransitiveDependencies:
              SnippetPageItemControllerFamily._allTransitiveDependencies,
        );

  final String shopId;

  @override
  bool operator ==(Object other) {
    return other is SnippetPageItemControllerProvider && other.shopId == shopId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, shopId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  SnippetPageItemState runNotifierBuild(
    covariant SnippetPageItemController notifier,
  ) {
    return notifier.build(
      shopId,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
