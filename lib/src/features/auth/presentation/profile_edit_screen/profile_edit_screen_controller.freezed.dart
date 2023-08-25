// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_edit_screen_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfileEditScreenState {
  User get user => throw _privateConstructorUsedError;
  bool get isNameValid => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isChanged => throw _privateConstructorUsedError;
  FlavorWheel? get currentFlavor => throw _privateConstructorUsedError;
  Uint8List? get imageFile => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileEditScreenStateCopyWith<ProfileEditScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEditScreenStateCopyWith<$Res> {
  factory $ProfileEditScreenStateCopyWith(ProfileEditScreenState value,
          $Res Function(ProfileEditScreenState) then) =
      _$ProfileEditScreenStateCopyWithImpl<$Res, ProfileEditScreenState>;
  @useResult
  $Res call(
      {User user,
      bool isNameValid,
      bool isLoading,
      bool isChanged,
      FlavorWheel? currentFlavor,
      Uint8List? imageFile});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$ProfileEditScreenStateCopyWithImpl<$Res,
        $Val extends ProfileEditScreenState>
    implements $ProfileEditScreenStateCopyWith<$Res> {
  _$ProfileEditScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? isNameValid = null,
    Object? isLoading = null,
    Object? isChanged = null,
    Object? currentFlavor = freezed,
    Object? imageFile = freezed,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      isNameValid: null == isNameValid
          ? _value.isNameValid
          : isNameValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isChanged: null == isChanged
          ? _value.isChanged
          : isChanged // ignore: cast_nullable_to_non_nullable
              as bool,
      currentFlavor: freezed == currentFlavor
          ? _value.currentFlavor
          : currentFlavor // ignore: cast_nullable_to_non_nullable
              as FlavorWheel?,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_EmailAuthScreenStateCopyWith<$Res>
    implements $ProfileEditScreenStateCopyWith<$Res> {
  factory _$$_EmailAuthScreenStateCopyWith(_$_EmailAuthScreenState value,
          $Res Function(_$_EmailAuthScreenState) then) =
      __$$_EmailAuthScreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {User user,
      bool isNameValid,
      bool isLoading,
      bool isChanged,
      FlavorWheel? currentFlavor,
      Uint8List? imageFile});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_EmailAuthScreenStateCopyWithImpl<$Res>
    extends _$ProfileEditScreenStateCopyWithImpl<$Res, _$_EmailAuthScreenState>
    implements _$$_EmailAuthScreenStateCopyWith<$Res> {
  __$$_EmailAuthScreenStateCopyWithImpl(_$_EmailAuthScreenState _value,
      $Res Function(_$_EmailAuthScreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? isNameValid = null,
    Object? isLoading = null,
    Object? isChanged = null,
    Object? currentFlavor = freezed,
    Object? imageFile = freezed,
  }) {
    return _then(_$_EmailAuthScreenState(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      isNameValid: null == isNameValid
          ? _value.isNameValid
          : isNameValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isChanged: null == isChanged
          ? _value.isChanged
          : isChanged // ignore: cast_nullable_to_non_nullable
              as bool,
      currentFlavor: freezed == currentFlavor
          ? _value.currentFlavor
          : currentFlavor // ignore: cast_nullable_to_non_nullable
              as FlavorWheel?,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc

class _$_EmailAuthScreenState implements _EmailAuthScreenState {
  const _$_EmailAuthScreenState(
      {required this.user,
      this.isNameValid = true,
      this.isLoading = false,
      this.isChanged = false,
      this.currentFlavor,
      this.imageFile});

  @override
  final User user;
  @override
  @JsonKey()
  final bool isNameValid;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isChanged;
  @override
  final FlavorWheel? currentFlavor;
  @override
  final Uint8List? imageFile;

  @override
  String toString() {
    return 'ProfileEditScreenState(user: $user, isNameValid: $isNameValid, isLoading: $isLoading, isChanged: $isChanged, currentFlavor: $currentFlavor, imageFile: $imageFile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmailAuthScreenState &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isNameValid, isNameValid) ||
                other.isNameValid == isNameValid) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isChanged, isChanged) ||
                other.isChanged == isChanged) &&
            (identical(other.currentFlavor, currentFlavor) ||
                other.currentFlavor == currentFlavor) &&
            const DeepCollectionEquality().equals(other.imageFile, imageFile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, isNameValid, isLoading,
      isChanged, currentFlavor, const DeepCollectionEquality().hash(imageFile));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmailAuthScreenStateCopyWith<_$_EmailAuthScreenState> get copyWith =>
      __$$_EmailAuthScreenStateCopyWithImpl<_$_EmailAuthScreenState>(
          this, _$identity);
}

abstract class _EmailAuthScreenState implements ProfileEditScreenState {
  const factory _EmailAuthScreenState(
      {required final User user,
      final bool isNameValid,
      final bool isLoading,
      final bool isChanged,
      final FlavorWheel? currentFlavor,
      final Uint8List? imageFile}) = _$_EmailAuthScreenState;

  @override
  User get user;
  @override
  bool get isNameValid;
  @override
  bool get isLoading;
  @override
  bool get isChanged;
  @override
  FlavorWheel? get currentFlavor;
  @override
  Uint8List? get imageFile;
  @override
  @JsonKey(ignore: true)
  _$$_EmailAuthScreenStateCopyWith<_$_EmailAuthScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
