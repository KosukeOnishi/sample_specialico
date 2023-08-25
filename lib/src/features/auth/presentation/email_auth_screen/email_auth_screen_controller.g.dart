// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_auth_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$emailAuthScreenControllerHash() =>
    r'e86a11d9aec8ce6b77d9c38cdc55b5fe281f43c7';

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

abstract class _$EmailAuthScreenController
    extends BuildlessAutoDisposeNotifier<EmailAuthScreenState> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  EmailAuthScreenState build(
    TextEditingController emailController,
    TextEditingController passwordController,
  );
}

/// See also [EmailAuthScreenController].
@ProviderFor(EmailAuthScreenController)
const emailAuthScreenControllerProvider = EmailAuthScreenControllerFamily();

/// See also [EmailAuthScreenController].
class EmailAuthScreenControllerFamily extends Family<EmailAuthScreenState> {
  /// See also [EmailAuthScreenController].
  const EmailAuthScreenControllerFamily();

  /// See also [EmailAuthScreenController].
  EmailAuthScreenControllerProvider call(
    TextEditingController emailController,
    TextEditingController passwordController,
  ) {
    return EmailAuthScreenControllerProvider(
      emailController,
      passwordController,
    );
  }

  @override
  EmailAuthScreenControllerProvider getProviderOverride(
    covariant EmailAuthScreenControllerProvider provider,
  ) {
    return call(
      provider.emailController,
      provider.passwordController,
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
  String? get name => r'emailAuthScreenControllerProvider';
}

/// See also [EmailAuthScreenController].
class EmailAuthScreenControllerProvider extends AutoDisposeNotifierProviderImpl<
    EmailAuthScreenController, EmailAuthScreenState> {
  /// See also [EmailAuthScreenController].
  EmailAuthScreenControllerProvider(
    this.emailController,
    this.passwordController,
  ) : super.internal(
          () => EmailAuthScreenController()
            ..emailController = emailController
            ..passwordController = passwordController,
          from: emailAuthScreenControllerProvider,
          name: r'emailAuthScreenControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$emailAuthScreenControllerHash,
          dependencies: EmailAuthScreenControllerFamily._dependencies,
          allTransitiveDependencies:
              EmailAuthScreenControllerFamily._allTransitiveDependencies,
        );

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  bool operator ==(Object other) {
    return other is EmailAuthScreenControllerProvider &&
        other.emailController == emailController &&
        other.passwordController == passwordController;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, emailController.hashCode);
    hash = _SystemHash.combine(hash, passwordController.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  EmailAuthScreenState runNotifierBuild(
    covariant EmailAuthScreenController notifier,
  ) {
    return notifier.build(
      emailController,
      passwordController,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
