// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FoodImpl _$$FoodImplFromJson(Map<String, dynamic> json) => _$FoodImpl(
      foodId: json['foodId'] as String,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      foodName: json['foodName'] as String,
      foodDescription: json['foodDescription'] as String?,
      foodImage: json['foodImage'] as String,
      foodPrice: (json['foodPrice'] as num).toDouble(),
      foodSalePrice: (json['foodSalePrice'] as num).toDouble(),
      foodRating: (json['foodRating'] as num?)?.toDouble(),
      relatedDetailFoods: (json['relatedDetailFoods'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$FoodImplToJson(_$FoodImpl instance) =>
    <String, dynamic>{
      'foodId': instance.foodId,
      'category': instance.category,
      'foodName': instance.foodName,
      'foodDescription': instance.foodDescription,
      'foodImage': instance.foodImage,
      'foodPrice': instance.foodPrice,
      'foodSalePrice': instance.foodSalePrice,
      'foodRating': instance.foodRating,
      'relatedDetailFoods': instance.relatedDetailFoods,
    };
