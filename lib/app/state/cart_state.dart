import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:order_food/models/cart.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState({
    Cart? cartModel,
    @Default(false) bool isLoading,
  }) = _CartState;
}