import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:order_food/models/address.dart';

part 'address_state.freezed.dart';

@freezed
class AddressState with _$AddressState {
  const factory AddressState({
    List<Address>? addressModel,
    @Default(false) bool isLoading,
  }) = _AddressState;
}