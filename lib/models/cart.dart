import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:order_food/models/cart_food.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';


@freezed
abstract class Cart with _$Cart {
  factory Cart({
    required String userId,
    required List<CartFood> foods,
    required String cartId,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}

extension CartExt on Cart{
  double get grandTotal{
    return foods.map((e) => e.food.foodPrice * e.quantity).fold(0, (price, cart) => price + cart);
  }
}