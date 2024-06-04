import 'package:freezed_annotation/freezed_annotation.dart';
import 'food_model.dart';
part 'favorite_food.freezed.dart';
part 'favorite_food.g.dart';

@freezed
abstract class FavoriteFood with _$FavoriteFood {
  factory FavoriteFood({
    required Food food,
  }) = _FavoriteFood;

  factory FavoriteFood.fromJson(Map<String, dynamic>json) => _$FavoriteFoodFromJson(json);
}