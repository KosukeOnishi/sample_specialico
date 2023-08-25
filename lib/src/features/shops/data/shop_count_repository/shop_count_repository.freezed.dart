// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_count_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShopCountData {
  int get nationWide => throw _privateConstructorUsedError;
  Map<Prefecture, int> get countsOfEachPrefecture =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShopCountDataCopyWith<ShopCountData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopCountDataCopyWith<$Res> {
  factory $ShopCountDataCopyWith(
          ShopCountData value, $Res Function(ShopCountData) then) =
      _$ShopCountDataCopyWithImpl<$Res, ShopCountData>;
  @useResult
  $Res call({int nationWide, Map<Prefecture, int> countsOfEachPrefecture});
}

/// @nodoc
class _$ShopCountDataCopyWithImpl<$Res, $Val extends ShopCountData>
    implements $ShopCountDataCopyWith<$Res> {
  _$ShopCountDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nationWide = null,
    Object? countsOfEachPrefecture = null,
  }) {
    return _then(_value.copyWith(
      nationWide: null == nationWide
          ? _value.nationWide
          : nationWide // ignore: cast_nullable_to_non_nullable
              as int,
      countsOfEachPrefecture: null == countsOfEachPrefecture
          ? _value.countsOfEachPrefecture
          : countsOfEachPrefecture // ignore: cast_nullable_to_non_nullable
              as Map<Prefecture, int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShopCountDataCopyWith<$Res>
    implements $ShopCountDataCopyWith<$Res> {
  factory _$$_ShopCountDataCopyWith(
          _$_ShopCountData value, $Res Function(_$_ShopCountData) then) =
      __$$_ShopCountDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int nationWide, Map<Prefecture, int> countsOfEachPrefecture});
}

/// @nodoc
class __$$_ShopCountDataCopyWithImpl<$Res>
    extends _$ShopCountDataCopyWithImpl<$Res, _$_ShopCountData>
    implements _$$_ShopCountDataCopyWith<$Res> {
  __$$_ShopCountDataCopyWithImpl(
      _$_ShopCountData _value, $Res Function(_$_ShopCountData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nationWide = null,
    Object? countsOfEachPrefecture = null,
  }) {
    return _then(_$_ShopCountData(
      nationWide: null == nationWide
          ? _value.nationWide
          : nationWide // ignore: cast_nullable_to_non_nullable
              as int,
      countsOfEachPrefecture: null == countsOfEachPrefecture
          ? _value._countsOfEachPrefecture
          : countsOfEachPrefecture // ignore: cast_nullable_to_non_nullable
              as Map<Prefecture, int>,
    ));
  }
}

/// @nodoc

class _$_ShopCountData implements _ShopCountData {
  const _$_ShopCountData(
      {required this.nationWide,
      required final Map<Prefecture, int> countsOfEachPrefecture})
      : _countsOfEachPrefecture = countsOfEachPrefecture;

  @override
  final int nationWide;
  final Map<Prefecture, int> _countsOfEachPrefecture;
  @override
  Map<Prefecture, int> get countsOfEachPrefecture {
    if (_countsOfEachPrefecture is EqualUnmodifiableMapView)
      return _countsOfEachPrefecture;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_countsOfEachPrefecture);
  }

  @override
  String toString() {
    return 'ShopCountData(nationWide: $nationWide, countsOfEachPrefecture: $countsOfEachPrefecture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShopCountData &&
            (identical(other.nationWide, nationWide) ||
                other.nationWide == nationWide) &&
            const DeepCollectionEquality().equals(
                other._countsOfEachPrefecture, _countsOfEachPrefecture));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nationWide,
      const DeepCollectionEquality().hash(_countsOfEachPrefecture));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShopCountDataCopyWith<_$_ShopCountData> get copyWith =>
      __$$_ShopCountDataCopyWithImpl<_$_ShopCountData>(this, _$identity);
}

abstract class _ShopCountData implements ShopCountData {
  const factory _ShopCountData(
          {required final int nationWide,
          required final Map<Prefecture, int> countsOfEachPrefecture}) =
      _$_ShopCountData;

  @override
  int get nationWide;
  @override
  Map<Prefecture, int> get countsOfEachPrefecture;
  @override
  @JsonKey(ignore: true)
  _$$_ShopCountDataCopyWith<_$_ShopCountData> get copyWith =>
      throw _privateConstructorUsedError;
}
