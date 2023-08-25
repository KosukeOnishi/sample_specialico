// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_weekday_texts_sheet_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$editWeekdayTextsSheetControllerHash() =>
    r'949d9d123f6e27a636c5c05d87be80de713b69f0';

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

abstract class _$EditWeekdayTextsSheetController
    extends BuildlessAutoDisposeNotifier<EditWeekdayTextsSheetState> {
  late final Shop shop;

  EditWeekdayTextsSheetState build(
    Shop shop,
  );
}

/// See also [EditWeekdayTextsSheetController].
@ProviderFor(EditWeekdayTextsSheetController)
const editWeekdayTextsSheetControllerProvider =
    EditWeekdayTextsSheetControllerFamily();

/// See also [EditWeekdayTextsSheetController].
class EditWeekdayTextsSheetControllerFamily
    extends Family<EditWeekdayTextsSheetState> {
  /// See also [EditWeekdayTextsSheetController].
  const EditWeekdayTextsSheetControllerFamily();

  /// See also [EditWeekdayTextsSheetController].
  EditWeekdayTextsSheetControllerProvider call(
    Shop shop,
  ) {
    return EditWeekdayTextsSheetControllerProvider(
      shop,
    );
  }

  @override
  EditWeekdayTextsSheetControllerProvider getProviderOverride(
    covariant EditWeekdayTextsSheetControllerProvider provider,
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
  String? get name => r'editWeekdayTextsSheetControllerProvider';
}

/// See also [EditWeekdayTextsSheetController].
class EditWeekdayTextsSheetControllerProvider
    extends AutoDisposeNotifierProviderImpl<EditWeekdayTextsSheetController,
        EditWeekdayTextsSheetState> {
  /// See also [EditWeekdayTextsSheetController].
  EditWeekdayTextsSheetControllerProvider(
    this.shop,
  ) : super.internal(
          () => EditWeekdayTextsSheetController()..shop = shop,
          from: editWeekdayTextsSheetControllerProvider,
          name: r'editWeekdayTextsSheetControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$editWeekdayTextsSheetControllerHash,
          dependencies: EditWeekdayTextsSheetControllerFamily._dependencies,
          allTransitiveDependencies:
              EditWeekdayTextsSheetControllerFamily._allTransitiveDependencies,
        );

  final Shop shop;

  @override
  bool operator ==(Object other) {
    return other is EditWeekdayTextsSheetControllerProvider &&
        other.shop == shop;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, shop.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  EditWeekdayTextsSheetState runNotifierBuild(
    covariant EditWeekdayTextsSheetController notifier,
  ) {
    return notifier.build(
      shop,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
