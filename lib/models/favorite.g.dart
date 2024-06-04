// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FavoriteImpl _$$FavoriteImplFromJson(Map<String, dynamic> json) =>
    _$FavoriteImpl(
      userId: json['userId'] as String,
      foods: (json['foods'] as List<dynamic>)
          .map((e) => FavoriteFood.fromJson(e as Map<String, dynamic>))
          .toList(),
      favoriteId: json['favoriteId'] as String,
    );

Map<String, dynamic> _$$FavoriteImplToJson(_$FavoriteImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'foods': instance.foods,
      'favoriteId': instance.favoriteId,
    };
