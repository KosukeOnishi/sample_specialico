// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggest_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$suggestScreenControllerHash() =>
    r'fbee42e747b7f234a4cac9be1d1f59c2880b6b1f';

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

abstract class _$SuggestScreenController
    extends BuildlessAutoDisposeNotifier<SuggestScreenState> {
  late final TextEditingController shopNameController;
  late final TextEditingController mapUrlController;

  SuggestScreenState build(
    TextEditingController shopNameController,
    TextEditingController mapUrlController,
  );
}

/// See also [SuggestScreenController].
@ProviderFor(SuggestScreenController)
const suggestScreenControllerProvider = SuggestScreenControllerFamily();

/// See also [SuggestScreenController].
class SuggestScreenControllerFamily extends Family<SuggestScreenState> {
  /// See also [SuggestScreenController].
  const SuggestScreenControllerFamily();

  /// See also [SuggestScreenController].
  SuggestScreenControllerProvider call(
    TextEditingController shopNameController,
    TextEditingController mapUrlController,
  ) {
    return SuggestScreenControllerProvider(
      shopNameController,
      mapUrlController,
    );
  }

  @override
  SuggestScreenControllerProvider getProviderOverride(
    covariant SuggestScreenControllerProvider provider,
  ) {
    return call(
      provider.shopNameController,
      provider.mapUrlController,
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
  String? get name => r'suggestScreenControllerProvider';
}

/// See also [SuggestScreenController].
class SuggestScreenControllerProvider extends AutoDisposeNotifierProviderImpl<
    SuggestScreenController, SuggestScreenState> {
  /// See also [SuggestScreenController].
  SuggestScreenControllerProvider(
    this.shopNameController,
    this.mapUrlController,
  ) : super.internal(
          () => SuggestScreenController()
            ..shopNameController = shopNameController
            ..mapUrlController = mapUrlController,
          from: suggestScreenControllerProvider,
          name: r'suggestScreenControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$suggestScreenControllerHash,
          dependencies: SuggestScreenControllerFamily._dependencies,
          allTransitiveDependencies:
              SuggestScreenControllerFamily._allTransitiveDependencies,
        );

  final TextEditingController shopNameController;
  final TextEditingController mapUrlController;

  @override
  bool operator ==(Object other) {
    return other is SuggestScreenControllerProvider &&
        other.shopNameController == shopNameController &&
        other.mapUrlController == mapUrlController;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, shopNameController.hashCode);
    hash = _SystemHash.combine(hash, mapUrlController.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  SuggestScreenState runNotifierBuild(
    covariant SuggestScreenController notifier,
  ) {
    return notifier.build(
      shopNameController,
      mapUrlController,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
