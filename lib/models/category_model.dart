import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:order_food/config/config.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

List<Category> categoriesFromJson(dynamic str) => List<Category>.from(
  (str).map(
    (e) => Category.fromJson(e),
  ) 
);


@freezed
abstract class Category with _$Category {
  factory Category(
    {required String categoryId,
    required String categoryName,
    required String? categoryImage}
  ) = _Category;
  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json); 
}

extension CategoryExt on Category{
  String get imagePath => Config.imageUrl + categoryImage!;
}