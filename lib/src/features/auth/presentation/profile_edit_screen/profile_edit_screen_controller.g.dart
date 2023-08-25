// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_edit_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$profileEditScreenControllerHash() =>
    r'80a1e20dfdacc4f66f38cab0690fab88a1f2e699';

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

abstract class _$ProfileEditScreenController
    extends BuildlessAutoDisposeNotifier<ProfileEditScreenState> {
  late final TextEditingController nameController;

  ProfileEditScreenState build(
    TextEditingController nameController,
  );
}

/// See also [ProfileEditScreenController].
@ProviderFor(ProfileEditScreenController)
const profileEditScreenControllerProvider = ProfileEditScreenControllerFamily();

/// See also [ProfileEditScreenController].
class ProfileEditScreenControllerFamily extends Family<ProfileEditScreenState> {
  /// See also [ProfileEditScreenController].
  const ProfileEditScreenControllerFamily();

  /// See also [ProfileEditScreenController].
  ProfileEditScreenControllerProvider call(
    TextEditingController nameController,
  ) {
    return ProfileEditScreenControllerProvider(
      nameController,
    );
  }

  @override
  ProfileEditScreenControllerProvider getProviderOverride(
    covariant ProfileEditScreenControllerProvider provider,
  ) {
    return call(
      provider.nameController,
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
  String? get name => r'profileEditScreenControllerProvider';
}

/// See also [ProfileEditScreenController].
class ProfileEditScreenControllerProvider
    extends AutoDisposeNotifierProviderImpl<ProfileEditScreenController,
        ProfileEditScreenState> {
  /// See also [ProfileEditScreenController].
  ProfileEditScreenControllerProvider(
    this.nameController,
  ) : super.internal(
          () => ProfileEditScreenController()..nameController = nameController,
          from: profileEditScreenControllerProvider,
          name: r'profileEditScreenControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$profileEditScreenControllerHash,
          dependencies: ProfileEditScreenControllerFamily._dependencies,
          allTransitiveDependencies:
              ProfileEditScreenControllerFamily._allTransitiveDependencies,
        );

  final TextEditingController nameController;

  @override
  bool operator ==(Object other) {
    return other is ProfileEditScreenControllerProvider &&
        other.nameController == nameController;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, nameController.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  ProfileEditScreenState runNotifierBuild(
    covariant ProfileEditScreenController notifier,
  ) {
    return notifier.build(
      nameController,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
