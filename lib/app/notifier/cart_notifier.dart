import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:order_food/api/api_service.dart';
import 'package:order_food/app/state/cart_state.dart';
import 'package:order_food/models/cart_food.dart';

class CartNotifier extends StateNotifier<CartState> {
  final APIService _apiService;
  CartNotifier(this._apiService) : super(const CartState()){
    getCartItems();
  }
  Future<void> getCartItems()async{
    state = state.copyWith(isLoading: true);
    final cartData = await _apiService.getCart();
    state = state.copyWith(cartModel: cartData);
    state = state.copyWith(isLoading: false);
  }

  Future<void> addCartItem(String foodId, int quantity)async{
    await _apiService.addCartItem(foodId, quantity);
    await getCartItems();
  }

  Future<void> removeCartItem(foodId, quantity)async{
    await _apiService.removeCartItem(foodId, quantity);

    var modifiableFoods = List<CartFood>.from(state.cartModel!.foods);

    // var isCartItem = state.cartModel!.foods.firstWhere((element) => element.food.foodId == foodId);
    var isCartItem = modifiableFoods.firstWhere((element) => element.food.foodId == foodId);
    if (isCartItem != null) {
     modifiableFoods.remove(isCartItem); 
    }
    var updateCarts = state.cartModel!.copyWith(foods: modifiableFoods);
    // updateCarts.foods.remove(isCartItem);
    state = state.copyWith(cartModel: updateCarts);
  }

  Future<void> updateQuantity(foodId, quantity, handle)async{
    var cartItem = state.cartModel!.foods.firstWhere((element) => element.food.foodId == foodId);
    var updateCarts = state.cartModel!.copyWith();
    List<CartFood> modifiableFoods = List<CartFood>.from(updateCarts.foods);
    if (handle == "-") {
      await _apiService.removeCartItem(foodId, 1);
      if (cartItem.quantity > 1) {
        CartFood cartFood = CartFood(quantity: cartItem.quantity - 1, food: cartItem.food);
        modifiableFoods.remove(cartItem);
        modifiableFoods.add(cartFood);
      }else{
        modifiableFoods.remove(cartItem);
      }
    }else{
      await _apiService.addCartItem(foodId, 1);
      CartFood cartFood = CartFood(quantity: cartItem.quantity + 1, food: cartItem.food);
      modifiableFoods.remove(cartItem);
      modifiableFoods.add(cartFood);
    }
    updateCarts = updateCarts.copyWith(foods: modifiableFoods);
    state = state.copyWith(cartModel: updateCarts);
  }
  Future<void> cleanCart() async {
    state = state.copyWith(isLoading: true);
    try {
      bool? success = await _apiService.cleanCart();
      if (success ?? false) {
        getCartItems(); // Reload the addresses
      } else {
        state = state.copyWith(isLoading: false);
      }
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }
}


