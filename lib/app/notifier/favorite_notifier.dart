import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:order_food/api/api_service.dart';
import 'package:order_food/app/state/favorite_state.dart';
import 'package:order_food/models/favorite_food.dart';

class FavoriteNotifier extends StateNotifier<FavoriteState> {
  final APIService _apiService;
  FavoriteNotifier(this._apiService) : super(const FavoriteState()){
    getFavoritesFood();
  }
  Future<void> getFavoritesFood() async {
    state = state.copyWith(isLoading: true);
    try {
      final favoriteData = await _apiService.getFavorites();
      state = state.copyWith(favoriteModel: favoriteData, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false); 
    }
  }

  Future<void> addFavoritesFood(String foodId)async{
    await _apiService.addFavorites(foodId);
    await getFavoritesFood();
  }

  Future<void> removeFavoritesFood(String foodId)async{
    await _apiService.removeFavorites(foodId);
    var modifiableFoods = List<FavoriteFood>.from(state.favoriteModel!.foods);
    var isCartItem = modifiableFoods.firstWhere((element) => element.food.foodId == foodId);
    if (isCartItem != null) {
      modifiableFoods.remove(isCartItem); 
    }
    var updateFavorites = state.favoriteModel!.copyWith(foods: modifiableFoods);
    state = state.copyWith(favoriteModel: updateFavorites);
  }

  Future<void> toggleFavorite(String foodId, bool isLiked)async{
    if (isLiked) {
      await removeFavoritesFood(foodId);
    }else{
      await addFavoritesFood(foodId);
    }
    await getFavoritesFood();
  }
}