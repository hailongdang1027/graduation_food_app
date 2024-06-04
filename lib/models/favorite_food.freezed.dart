// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_food.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FavoriteFood _$FavoriteFoodFromJson(Map<String, dynamic> json) {
  return _FavoriteFood.fromJson(json);
}

/// @nodoc
mixin _$FavoriteFood {
  Food get food => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoriteFoodCopyWith<FavoriteFood> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteFoodCopyWith<$Res> {
  factory $FavoriteFoodCopyWith(
          FavoriteFood value, $Res Function(FavoriteFood) then) =
      _$FavoriteFoodCopyWithImpl<$Res, FavoriteFood>;
  @useResult
  $Res call({Food food});

  $FoodCopyWith<$Res> get food;
}

/// @nodoc
class _$FavoriteFoodCopyWithImpl<$Res, $Val extends FavoriteFood>
    implements $FavoriteFoodCopyWith<$Res> {
  _$FavoriteFoodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = null,
  }) {
    return _then(_value.copyWith(
      food: null == food
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
              as Food,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FoodCopyWith<$Res> get food {
    return $FoodCopyWith<$Res>(_value.food, (value) {
      return _then(_value.copyWith(food: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FavoriteFoodImplCopyWith<$Res>
    implements $FavoriteFoodCopyWith<$Res> {
  factory _$$FavoriteFoodImplCopyWith(
          _$FavoriteFoodImpl value, $Res Function(_$FavoriteFoodImpl) then) =
      __$$FavoriteFoodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Food food});

  @override
  $FoodCopyWith<$Res> get food;
}

/// @nodoc
class __$$FavoriteFoodImplCopyWithImpl<$Res>
    extends _$FavoriteFoodCopyWithImpl<$Res, _$FavoriteFoodImpl>
    implements _$$FavoriteFoodImplCopyWith<$Res> {
  __$$FavoriteFoodImplCopyWithImpl(
      _$FavoriteFoodImpl _value, $Res Function(_$FavoriteFoodImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = null,
  }) {
    return _then(_$FavoriteFoodImpl(
      food: null == food
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
              as Food,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FavoriteFoodImpl implements _FavoriteFood {
  _$FavoriteFoodImpl({required this.food});

  factory _$FavoriteFoodImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavoriteFoodImplFromJson(json);

  @override
  final Food food;

  @override
  String toString() {
    return 'FavoriteFood(food: $food)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteFoodImpl &&
            (identical(other.food, food) || other.food == food));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, food);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteFoodImplCopyWith<_$FavoriteFoodImpl> get copyWith =>
      __$$FavoriteFoodImplCopyWithImpl<_$FavoriteFoodImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavoriteFoodImplToJson(
      this,
    );
  }
}

abstract class _FavoriteFood implements FavoriteFood {
  factory _FavoriteFood({required final Food food}) = _$FavoriteFoodImpl;

  factory _FavoriteFood.fromJson(Map<String, dynamic> json) =
      _$FavoriteFoodImpl.fromJson;

  @override
  Food get food;
  @override
  @JsonKey(ignore: true)
  _$$FavoriteFoodImplCopyWith<_$FavoriteFoodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
