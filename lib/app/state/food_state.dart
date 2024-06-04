import 'package:order_food/models/food_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_state.freezed.dart';


@freezed
abstract class FoodsState with _$FoodsState{
  factory FoodsState({
    @Default(<Food>[]) List<Food> foods,
    @Default(true) bool isNext,
    @Default(false) bool isLoading
  }) = _FoodsState;
}

