import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:order_food/models/favorite_food.dart';

part 'favorite.freezed.dart';
part 'favorite.g.dart';


@freezed
abstract class Favorite with _$Favorite {
  factory Favorite({
    required String userId,
    required List<FavoriteFood> foods,
    required String favoriteId,
  }) = _Favorite;

  factory Favorite.fromJson(Map<String, dynamic> json) => _$FavoriteFromJson(json);
}

