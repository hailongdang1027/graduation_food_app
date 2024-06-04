import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:order_food/config/config.dart';
import 'package:order_food/models/category_model.dart';

part 'food_model.freezed.dart';
part 'food_model.g.dart';

List<Food> foodsFromJson(dynamic str) => List<Food>.from(
  (str).map(
    (e) => Food.fromJson(e),
  ) 
);

@freezed
abstract class Food with _$Food {
  factory Food(
    {required String foodId,
    required Category category,
    required String foodName,
    required String? foodDescription,
    required String foodImage,
    required double foodPrice,
    required double foodSalePrice,
    required double? foodRating,
    List<String>? relatedDetailFoods,
    }

  ) = _Food;
  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json); 
}


extension FoodExt on Food{
  String get imagePath => Config.imageUrl + foodImage;
  int get calculationSale{
    double discPercent = 0;
    if (!foodPrice.isNaN) {
      double regularPrice = foodPrice;
      double salePrice = foodSalePrice > 0 ? foodSalePrice : regularPrice;

      double discount = regularPrice - salePrice;
      discPercent = (discount / regularPrice) * 100;
    }
    return discPercent.round();
  }
}