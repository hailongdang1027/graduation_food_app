// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_food.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CartFood _$CartFoodFromJson(Map<String, dynamic> json) {
  return _CartFood.fromJson(json);
}

/// @nodoc
mixin _$CartFood {
  int get quantity => throw _privateConstructorUsedError;
  Food get food => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartFoodCopyWith<CartFood> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartFoodCopyWith<$Res> {
  factory $CartFoodCopyWith(CartFood value, $Res Function(CartFood) then) =
      _$CartFoodCopyWithImpl<$Res, CartFood>;
  @useResult
  $Res call({int quantity, Food food});

  $FoodCopyWith<$Res> get food;
}

/// @nodoc
class _$CartFoodCopyWithImpl<$Res, $Val extends CartFood>
    implements $CartFoodCopyWith<$Res> {
  _$CartFoodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = null,
    Object? food = null,
  }) {
    return _then(_value.copyWith(
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$CartFoodImplCopyWith<$Res>
    implements $CartFoodCopyWith<$Res> {
  factory _$$CartFoodImplCopyWith(
          _$CartFoodImpl value, $Res Function(_$CartFoodImpl) then) =
      __$$CartFoodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int quantity, Food food});

  @override
  $FoodCopyWith<$Res> get food;
}

/// @nodoc
class __$$CartFoodImplCopyWithImpl<$Res>
    extends _$CartFoodCopyWithImpl<$Res, _$CartFoodImpl>
    implements _$$CartFoodImplCopyWith<$Res> {
  __$$CartFoodImplCopyWithImpl(
      _$CartFoodImpl _value, $Res Function(_$CartFoodImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = null,
    Object? food = null,
  }) {
    return _then(_$CartFoodImpl(
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      food: null == food
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
              as Food,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartFoodImpl implements _CartFood {
  _$CartFoodImpl({required this.quantity, required this.food});

  factory _$CartFoodImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartFoodImplFromJson(json);

  @override
  final int quantity;
  @override
  final Food food;

  @override
  String toString() {
    return 'CartFood(quantity: $quantity, food: $food)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartFoodImpl &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.food, food) || other.food == food));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, quantity, food);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartFoodImplCopyWith<_$CartFoodImpl> get copyWith =>
      __$$CartFoodImplCopyWithImpl<_$CartFoodImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartFoodImplToJson(
      this,
    );
  }
}

abstract class _CartFood implements CartFood {
  factory _CartFood({required final int quantity, required final Food food}) =
      _$CartFoodImpl;

  factory _CartFood.fromJson(Map<String, dynamic> json) =
      _$CartFoodImpl.fromJson;

  @override
  int get quantity;
  @override
  Food get food;
  @override
  @JsonKey(ignore: true)
  _$$CartFoodImplCopyWith<_$CartFoodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
