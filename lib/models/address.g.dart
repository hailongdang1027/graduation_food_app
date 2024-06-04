// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      addressId: json['addressId'] as String,
      city: json['city'] as String,
      street: json['street'] as String,
      house: json['house'] as String,
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'addressId': instance.addressId,
      'city': instance.city,
      'street': instance.street,
      'house': instance.house,
    };
