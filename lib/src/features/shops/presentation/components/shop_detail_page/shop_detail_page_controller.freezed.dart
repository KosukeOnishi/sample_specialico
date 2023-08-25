// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_detail_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShopDetailPageState {
  double get currentPhotoPosition => throw _privateConstructorUsedError;
  PreloadPageController get pageController =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShopDetailPageStateCopyWith<ShopDetailPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopDetailPageStateCopyWith<$Res> {
  factory $ShopDetailPageStateCopyWith(
          ShopDetailPageState value, $Res Function(ShopDetailPageState) then) =
      _$ShopDetailPageStateCopyWithImpl<$Res, ShopDetailPageState>;
  @useResult
  $Res call(
      {double currentPhotoPosition, PreloadPageController pageController});
}

/// @nodoc
class _$ShopDetailPageStateCopyWithImpl<$Res, $Val extends ShopDetailPageState>
    implements $ShopDetailPageStateCopyWith<$Res> {
  _$ShopDetailPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPhotoPosition = null,
    Object? pageController = null,
  }) {
    return _then(_value.copyWith(
      currentPhotoPosition: null == currentPhotoPosition
          ? _value.currentPhotoPosition
          : currentPhotoPosition // ignore: cast_nullable_to_non_nullable
              as double,
      pageController: null == pageController
          ? _value.pageController
          : pageController // ignore: cast_nullable_to_non_nullable
              as PreloadPageController,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShopDetailPageStateCopyWith<$Res>
    implements $ShopDetailPageStateCopyWith<$Res> {
  factory _$$_ShopDetailPageStateCopyWith(_$_ShopDetailPageState value,
          $Res Function(_$_ShopDetailPageState) then) =
      __$$_ShopDetailPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double currentPhotoPosition, PreloadPageController pageController});
}

/// @nodoc
class __$$_ShopDetailPageStateCopyWithImpl<$Res>
    extends _$ShopDetailPageStateCopyWithImpl<$Res, _$_ShopDetailPageState>
    implements _$$_ShopDetailPageStateCopyWith<$Res> {
  __$$_ShopDetailPageStateCopyWithImpl(_$_ShopDetailPageState _value,
      $Res Function(_$_ShopDetailPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPhotoPosition = null,
    Object? pageController = null,
  }) {
    return _then(_$_ShopDetailPageState(
      currentPhotoPosition: null == currentPhotoPosition
          ? _value.currentPhotoPosition
          : currentPhotoPosition // ignore: cast_nullable_to_non_nullable
              as double,
      pageController: null == pageController
          ? _value.pageController
          : pageController // ignore: cast_nullable_to_non_nullable
              as PreloadPageController,
    ));
  }
}

/// @nodoc

class _$_ShopDetailPageState implements _ShopDetailPageState {
  const _$_ShopDetailPageState(
      {required this.currentPhotoPosition, required this.pageController});

  @override
  final double currentPhotoPosition;
  @override
  final PreloadPageController pageController;

  @override
  String toString() {
    return 'ShopDetailPageState(currentPhotoPosition: $currentPhotoPosition, pageController: $pageController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShopDetailPageState &&
            (identical(other.currentPhotoPosition, currentPhotoPosition) ||
                other.currentPhotoPosition == currentPhotoPosition) &&
            (identical(other.pageController, pageController) ||
                other.pageController == pageController));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, currentPhotoPosition, pageController);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShopDetailPageStateCopyWith<_$_ShopDetailPageState> get copyWith =>
      __$$_ShopDetailPageStateCopyWithImpl<_$_ShopDetailPageState>(
          this, _$identity);
}

abstract class _ShopDetailPageState implements ShopDetailPageState {
  const factory _ShopDetailPageState(
          {required final double currentPhotoPosition,
          required final PreloadPageController pageController}) =
      _$_ShopDetailPageState;

  @override
  double get currentPhotoPosition;
  @override
  PreloadPageController get pageController;
  @override
  @JsonKey(ignore: true)
  _$$_ShopDetailPageStateCopyWith<_$_ShopDetailPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
