import 'package:freezed_annotation/freezed_annotation.dart';
part 'address.freezed.dart';
part 'address.g.dart';

List<Address> addressesFromJson(dynamic str) => List<Address>.from(
  (str).map(
    (e) => Address.fromJson(e),
  ) 
);

@freezed 
abstract class Address with _$Address {
  factory Address({
    required String addressId,
    required String city,
    required String street,
    required String house
  }) = _Address;
  factory Address.fromJson(Map<String, dynamic>json) => _$AddressFromJson(json);
}