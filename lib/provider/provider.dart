import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:order_food/api/api_service.dart';
import 'package:order_food/app/notifier/cart_notifier.dart';
import 'package:order_food/app/notifier/favorite_notifier.dart';
import 'package:order_food/app/notifier/foods_notifier.dart';
import 'package:order_food/app/notifier/foods_notifier_filter.dart';
import 'package:order_food/app/state/address_state.dart';
import 'package:order_food/app/state/cart_state.dart';
import 'package:order_food/app/state/favorite_state.dart';
import 'package:order_food/app/state/food_state.dart';
import 'package:order_food/models/address.dart';
import 'package:order_food/models/food_model.dart';
import 'package:order_food/models/food_pagination.dart';
import 'package:order_food/models/page_model.dart';
import 'package:order_food/models/category_model.dart';
import 'package:order_food/models/restaurant.dart';

import '../app/notifier/address_notifier.dart';


final categoriesProvider =
    FutureProvider.family<List<Category>?, PageModel>((ref, pageModel) {
  final apiRepository = ref.watch(apiService);
  return apiRepository.getCategories(pageModel.page, pageModel.pageSize);
});

final foodsProvider =
    FutureProvider.family<List<Food>?, FoodPaginationModel>((ref, foodPaginationModel) {
  final apiRepository = ref.watch(apiService);
  return apiRepository.getFoods(foodPaginationModel);
});

final restaurantsProvider =
    FutureProvider.family<List<Restaurant>?, PageModel>((ref, pageModel) {
  final apiRepository = ref.watch(apiService);
  return apiRepository.getRestaurants(pageModel.page, pageModel.pageSize);
});

final foodsFilterProvider = StateNotifierProvider<FoodsNotifierFilter, FoodPaginationModel>(
  (ref) => FoodsNotifierFilter(),
);

final foodsNotifierProvider = StateNotifierProvider<FoodsNotifier, FoodsState>(
  (ref) => FoodsNotifier(
    ref.watch(apiService),
    ref.watch(foodsFilterProvider),
));

final foodDetailsProvider = FutureProvider.family<Food?, String>(
  (ref, foodId) {
    final apiRepository = ref.watch(apiService);
    return apiRepository.getFoodDetails(foodId);
  }
);

final relateFoodsProvider = FutureProvider.family<List<Food>?, FoodPaginationModel>(
  (ref, foodPaginationModel){
    final apiRepository = ref.watch(apiService);
    return apiRepository.getFoods(foodPaginationModel);
  }
);

final cartItemsProvider = StateNotifierProvider<CartNotifier, CartState>(
  (ref) => CartNotifier(
    ref.watch(apiService),
  )
);

final favoriteItemsProvider = StateNotifierProvider<FavoriteNotifier, FavoriteState>(
  (ref) => FavoriteNotifier(
    ref.watch(apiService),
  )
);


final addressNotifierProvider = StateNotifierProvider<AddressNotifier, AddressState>((ref) {
  return AddressNotifier(ref.watch(apiService));
});


// final searchProvider = FutureProvider.family<Food?, String>(
//   (ref, key){
//     final apiRepository = ref.watch(apiService);
//     return apiRepository.searchFood(key);
//   }
// );

// final searchProvider = FutureProvider.family<Restaurant?, String>(
//   (ref, key){
//     final apiRepository = ref.watch(apiService);
//     return apiRepository.searchRestaurant(key);
//   }
// );

final searchRestaurantProvider = FutureProvider.family<List<Restaurant>?, String>(
  (ref, key){
    final apiRepository = ref.watch(apiService);
    return apiRepository.searchRestaurant(key);
  }
);


