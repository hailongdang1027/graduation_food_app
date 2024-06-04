import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:order_food/api/api_service.dart';
import 'package:order_food/app/state/address_state.dart';
import 'package:order_food/models/address.dart';



class AddressNotifier extends StateNotifier<AddressState> {
  final APIService _apiService;
  AddressNotifier(this._apiService) : super(const AddressState()){
    getLoadAddress();
  }
  Future<void> getLoadAddress()async{
    state = state.copyWith(isLoading: true);
    try {
      List<Address>? address = await _apiService.getAddress();
      state = state.copyWith(addressModel: address, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      // Handle errors if needed
    }
  }

  Future<void> addAddress(String city, String house, String street) async {
    state = state.copyWith(isLoading: true);
    try {
      bool? success = await _apiService.addAddress(city, house, street);
      if (success ?? false) {
        getLoadAddress(); 
      } else {
        state = state.copyWith(isLoading: false);
      }
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> updateAddress(String addressId, String city, String house, String street) async {
    state = state.copyWith(isLoading: true);
    try {
      bool? success = await _apiService.updateAddress(addressId, city, house, street);
      if (success ?? false) {
        getLoadAddress(); // Reload the addresses
      } else {
        state = state.copyWith(isLoading: false);
      }
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> removeAddress(String id) async {
    state = state.copyWith(isLoading: true);
    try {
      bool? success = await _apiService.removeAddress(id);
      if (success ?? false) {
        getLoadAddress(); // Reload the addresses
      } else {
        state = state.copyWith(isLoading: false);
      }
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }
}