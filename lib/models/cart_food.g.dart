// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartFoodImpl _$$CartFoodImplFromJson(Map<String, dynamic> json) =>
    _$CartFoodImpl(
      quantity: (json['quantity'] as num).toInt(),
      food: Food.fromJson(json['food'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CartFoodImplToJson(_$CartFoodImpl instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      'food': instance.food,
    };
