import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:order_food/api/api_service.dart';
import 'package:order_food/app/state/food_state.dart';
import 'package:order_food/models/food_pagination.dart';
import 'package:order_food/models/page_model.dart';

class FoodsNotifier extends StateNotifier<FoodsState>{
  final APIService _apiService;
  final FoodPaginationModel _foodPaginationModel;
  FoodsNotifier(this._apiService, this._foodPaginationModel):super(FoodsState());
  int _page = 1;
  Future<void> getFoods()async{
    if (state.isLoading || !state.isNext) {
      return;
    }
    state = state.copyWith(isLoading: true);
    var foodPaginationModel = _foodPaginationModel.copyWith(
      pageModel: PageModel(
        page: _page,
        pageSize: 10,
      )
    );

    final foods = await _apiService.getFoods(foodPaginationModel);
    final newFoods = [...state.foods, ...foods!];
    if (foods.length % 10 != 0 || foods.isEmpty) {
      state = state.copyWith(isNext: false);
    }

    state = state.copyWith(foods: newFoods);
    _page++;
    state = state.copyWith(isLoading: false);
  }
  Future<void> refreshFoods()async{
    state = state.copyWith(foods: [], isNext: true);
    _page = 1;
    await getFoods();
  }
}