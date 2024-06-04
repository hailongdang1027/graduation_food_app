// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FoodsState {
  List<Food> get foods => throw _privateConstructorUsedError;
  bool get isNext => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FoodsStateCopyWith<FoodsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodsStateCopyWith<$Res> {
  factory $FoodsStateCopyWith(
          FoodsState value, $Res Function(FoodsState) then) =
      _$FoodsStateCopyWithImpl<$Res, FoodsState>;
  @useResult
  $Res call({List<Food> foods, bool isNext, bool isLoading});
}

/// @nodoc
class _$FoodsStateCopyWithImpl<$Res, $Val extends FoodsState>
    implements $FoodsStateCopyWith<$Res> {
  _$FoodsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foods = null,
    Object? isNext = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      foods: null == foods
          ? _value.foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<Food>,
      isNext: null == isNext
          ? _value.isNext
          : isNext // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FoodsStateImplCopyWith<$Res>
    implements $FoodsStateCopyWith<$Res> {
  factory _$$FoodsStateImplCopyWith(
          _$FoodsStateImpl value, $Res Function(_$FoodsStateImpl) then) =
      __$$FoodsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Food> foods, bool isNext, bool isLoading});
}

/// @nodoc
class __$$FoodsStateImplCopyWithImpl<$Res>
    extends _$FoodsStateCopyWithImpl<$Res, _$FoodsStateImpl>
    implements _$$FoodsStateImplCopyWith<$Res> {
  __$$FoodsStateImplCopyWithImpl(
      _$FoodsStateImpl _value, $Res Function(_$FoodsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foods = null,
    Object? isNext = null,
    Object? isLoading = null,
  }) {
    return _then(_$FoodsStateImpl(
      foods: null == foods
          ? _value._foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<Food>,
      isNext: null == isNext
          ? _value.isNext
          : isNext // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FoodsStateImpl implements _FoodsState {
  _$FoodsStateImpl(
      {final List<Food> foods = const <Food>[],
      this.isNext = true,
      this.isLoading = false})
      : _foods = foods;

  final List<Food> _foods;
  @override
  @JsonKey()
  List<Food> get foods {
    if (_foods is EqualUnmodifiableListView) return _foods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foods);
  }

  @override
  @JsonKey()
  final bool isNext;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'FoodsState(foods: $foods, isNext: $isNext, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodsStateImpl &&
            const DeepCollectionEquality().equals(other._foods, _foods) &&
            (identical(other.isNext, isNext) || other.isNext == isNext) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_foods), isNext, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodsStateImplCopyWith<_$FoodsStateImpl> get copyWith =>
      __$$FoodsStateImplCopyWithImpl<_$FoodsStateImpl>(this, _$identity);
}

abstract class _FoodsState implements FoodsState {
  factory _FoodsState(
      {final List<Food> foods,
      final bool isNext,
      final bool isLoading}) = _$FoodsStateImpl;

  @override
  List<Food> get foods;
  @override
  bool get isNext;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$FoodsStateImplCopyWith<_$FoodsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
