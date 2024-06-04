import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:order_food/models/page_model.dart';

part 'food_pagination.freezed.dart';
// part 'food_pagination.g.dart';

@freezed
abstract class FoodPaginationModel with _$FoodPaginationModel {
  factory FoodPaginationModel({
    required PageModel pageModel,
    String? categoryId,
    List<String>? foodIds,
  }) = _FoodPaginationModel;
  // factory FoodPaginationModel.fromJson(Map<String, dynamic> json) => _$FoodPaginationModelFromJson(json);
}