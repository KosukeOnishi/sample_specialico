// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_report_sheet_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShopReportSheetState {
  Map<ShopReportType, bool> get boolFlags => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get shouldEnableSubmit => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShopReportSheetStateCopyWith<ShopReportSheetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopReportSheetStateCopyWith<$Res> {
  factory $ShopReportSheetStateCopyWith(ShopReportSheetState value,
          $Res Function(ShopReportSheetState) then) =
      _$ShopReportSheetStateCopyWithImpl<$Res, ShopReportSheetState>;
  @useResult
  $Res call(
      {Map<ShopReportType, bool> boolFlags,
      bool isLoading,
      bool shouldEnableSubmit});
}

/// @nodoc
class _$ShopReportSheetStateCopyWithImpl<$Res,
        $Val extends ShopReportSheetState>
    implements $ShopReportSheetStateCopyWith<$Res> {
  _$ShopReportSheetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boolFlags = null,
    Object? isLoading = null,
    Object? shouldEnableSubmit = null,
  }) {
    return _then(_value.copyWith(
      boolFlags: null == boolFlags
          ? _value.boolFlags
          : boolFlags // ignore: cast_nullable_to_non_nullable
              as Map<ShopReportType, bool>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      shouldEnableSubmit: null == shouldEnableSubmit
          ? _value.shouldEnableSubmit
          : shouldEnableSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShopReportSheetStateCopyWith<$Res>
    implements $ShopReportSheetStateCopyWith<$Res> {
  factory _$$_ShopReportSheetStateCopyWith(_$_ShopReportSheetState value,
          $Res Function(_$_ShopReportSheetState) then) =
      __$$_ShopReportSheetStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<ShopReportType, bool> boolFlags,
      bool isLoading,
      bool shouldEnableSubmit});
}

/// @nodoc
class __$$_ShopReportSheetStateCopyWithImpl<$Res>
    extends _$ShopReportSheetStateCopyWithImpl<$Res, _$_ShopReportSheetState>
    implements _$$_ShopReportSheetStateCopyWith<$Res> {
  __$$_ShopReportSheetStateCopyWithImpl(_$_ShopReportSheetState _value,
      $Res Function(_$_ShopReportSheetState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boolFlags = null,
    Object? isLoading = null,
    Object? shouldEnableSubmit = null,
  }) {
    return _then(_$_ShopReportSheetState(
      boolFlags: null == boolFlags
          ? _value._boolFlags
          : boolFlags // ignore: cast_nullable_to_non_nullable
              as Map<ShopReportType, bool>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      shouldEnableSubmit: null == shouldEnableSubmit
          ? _value.shouldEnableSubmit
          : shouldEnableSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ShopReportSheetState implements _ShopReportSheetState {
  const _$_ShopReportSheetState(
      {final Map<ShopReportType, bool> boolFlags = const {},
      this.isLoading = false,
      this.shouldEnableSubmit = false})
      : _boolFlags = boolFlags;

  final Map<ShopReportType, bool> _boolFlags;
  @override
  @JsonKey()
  Map<ShopReportType, bool> get boolFlags {
    if (_boolFlags is EqualUnmodifiableMapView) return _boolFlags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_boolFlags);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool shouldEnableSubmit;

  @override
  String toString() {
    return 'ShopReportSheetState(boolFlags: $boolFlags, isLoading: $isLoading, shouldEnableSubmit: $shouldEnableSubmit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShopReportSheetState &&
            const DeepCollectionEquality()
                .equals(other._boolFlags, _boolFlags) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.shouldEnableSubmit, shouldEnableSubmit) ||
                other.shouldEnableSubmit == shouldEnableSubmit));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_boolFlags),
      isLoading,
      shouldEnableSubmit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShopReportSheetStateCopyWith<_$_ShopReportSheetState> get copyWith =>
      __$$_ShopReportSheetStateCopyWithImpl<_$_ShopReportSheetState>(
          this, _$identity);
}

abstract class _ShopReportSheetState implements ShopReportSheetState {
  const factory _ShopReportSheetState(
      {final Map<ShopReportType, bool> boolFlags,
      final bool isLoading,
      final bool shouldEnableSubmit}) = _$_ShopReportSheetState;

  @override
  Map<ShopReportType, bool> get boolFlags;
  @override
  bool get isLoading;
  @override
  bool get shouldEnableSubmit;
  @override
  @JsonKey(ignore: true)
  _$$_ShopReportSheetStateCopyWith<_$_ShopReportSheetState> get copyWith =>
      throw _privateConstructorUsedError;
}
