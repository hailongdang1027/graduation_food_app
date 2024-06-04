import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:order_food/models/food_pagination.dart';
import 'package:order_food/models/page_model.dart';

class FoodsNotifierFilter extends StateNotifier<FoodPaginationModel> {
  FoodsNotifierFilter():super(
    FoodPaginationModel(
      pageModel: PageModel(
        page: 0, 
        pageSize:10
        )
      )
    );
    void setFoodFilter(FoodPaginationModel model){
      state = model;
    }
}