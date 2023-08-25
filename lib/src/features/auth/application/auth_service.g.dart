// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isLikedHash() => r'974a55544cdcc7da19f1525c8716f911a81a5bd8';

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

typedef IsLikedRef = AutoDisposeProviderRef<bool>;

/// See also [isLiked].
@ProviderFor(isLiked)
const isLikedProvider = IsLikedFamily();

/// See also [isLiked].
class IsLikedFamily extends Family<bool> {
  /// See also [isLiked].
  const IsLikedFamily();

  /// See also [isLiked].
  IsLikedProvider call(
    String shopId,
  ) {
    return IsLikedProvider(
      shopId,
    );
  }

  @override
  IsLikedProvider getProviderOverride(
    covariant IsLikedProvider provider,
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
  String? get name => r'isLikedProvider';
}

/// See also [isLiked].
class IsLikedProvider extends AutoDisposeProvider<bool> {
  /// See also [isLiked].
  IsLikedProvider(
    this.shopId,
  ) : super.internal(
          (ref) => isLiked(
            ref,
            shopId,
          ),
          from: isLikedProvider,
          name: r'isLikedProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isLikedHash,
          dependencies: IsLikedFamily._dependencies,
          allTransitiveDependencies: IsLikedFamily._allTransitiveDependencies,
        );

  final String shopId;

  @override
  bool operator ==(Object other) {
    return other is IsLikedProvider && other.shopId == shopId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, shopId.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
