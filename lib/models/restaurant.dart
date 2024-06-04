import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:order_food/config/config.dart';

part 'restaurant.freezed.dart';
part 'restaurant.g.dart';

List<Restaurant> restaurantsFromJson(dynamic str) => List<Restaurant>.from(
  (str).map(
    (e) => Restaurant.fromJson(e),
  ) 
);


@freezed
abstract class Restaurant with _$Restaurant{
  factory Restaurant(
    {required String restaurantId,
    required String restaurantName,
    required String restaurantDescription,
    required String restaurantAddress,
    required double restaurantRating,
    required String restaurantImage}
  ) = _Restaurant;
  factory Restaurant.fromJson(Map<String, dynamic> json) => _$RestaurantFromJson(json); 
}

extension RestaurantExt on Restaurant{
  String get resImagePath => Config.imageUrl + restaurantImage;
}