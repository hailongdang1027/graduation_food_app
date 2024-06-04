// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestaurantImpl _$$RestaurantImplFromJson(Map<String, dynamic> json) =>
    _$RestaurantImpl(
      restaurantId: json['restaurantId'] as String,
      restaurantName: json['restaurantName'] as String,
      restaurantDescription: json['restaurantDescription'] as String,
      restaurantAddress: json['restaurantAddress'] as String,
      restaurantRating: (json['restaurantRating'] as num).toDouble(),
      restaurantImage: json['restaurantImage'] as String,
    );

Map<String, dynamic> _$$RestaurantImplToJson(_$RestaurantImpl instance) =>
    <String, dynamic>{
      'restaurantId': instance.restaurantId,
      'restaurantName': instance.restaurantName,
      'restaurantDescription': instance.restaurantDescription,
      'restaurantAddress': instance.restaurantAddress,
      'restaurantRating': instance.restaurantRating,
      'restaurantImage': instance.restaurantImage,
    };
