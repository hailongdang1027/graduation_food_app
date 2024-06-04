import 'package:freezed_annotation/freezed_annotation.dart';
import 'food_model.dart';
part 'cart_food.freezed.dart';
part 'cart_food.g.dart';

@freezed
abstract class CartFood with _$CartFood {
  factory CartFood({
    required int quantity,
    required Food food,
  }) = _CartFood;

  factory CartFood.fromJson(Map<String, dynamic>json) => _$CartFoodFromJson(json);
}