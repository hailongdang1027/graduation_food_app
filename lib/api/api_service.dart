import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:order_food/config/config.dart';
import 'package:order_food/models/address.dart';
import 'package:order_food/models/cart.dart';
import 'package:order_food/models/category_model.dart';
import 'package:order_food/models/food_model.dart';
import 'package:order_food/models/food_pagination.dart';
import 'package:order_food/models/restaurant.dart';


import '../main.dart';
import '../models/favorite.dart';



final apiService = Provider((ref) => APIService());

class APIService {
  static var client = http.Client();  
  User? user = FirebaseAuth.instance.currentUser;
  Future<List<Category>?> getCategories(int page, int pageSize) async{
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    Map<String, String> queryString = {
      'page': page.toString(),
      'pageSize': pageSize.toString()
    };
    var url = Uri.http(Config.apiUrl, Config.categoryApi, queryString);
    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return categoriesFromJson(data["data"]);
    }else{
      return null;
    }
  }

  Future<List<Food>?> getFoods(FoodPaginationModel foodPaginationModel) async{
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    Map<String, String> queryString = {
      'page': foodPaginationModel.pageModel.page.toString(),
      'pageSize': foodPaginationModel.pageModel.pageSize.toString()
    };

    if (foodPaginationModel.categoryId != null) {
      queryString["categoryId"] = foodPaginationModel.categoryId!;
    }
    // print(foodPaginationModel.categoryId);
    if (foodPaginationModel.foodIds != null) {
      queryString["foodIds"] = foodPaginationModel.foodIds!.join(",");
    }
    // print(foodPaginationModel.foodIds);
    var url = Uri.http(Config.apiUrl, Config.foodApi, queryString);
    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return foodsFromJson(data["data"]);
    }else{
      return null;
    }
  }


  Future<List<Restaurant>?> getRestaurants(int page, int pageSize) async{
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    Map<String, String> queryString = {
      'page': page.toString(),
      'pageSize': pageSize.toString()
    };
    var url = Uri.http(Config.apiUrl, Config.restaurantApi, queryString);
    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return restaurantsFromJson(data["data"]);
    }else{
      return null;
    }
  }

  Future<Food?> getFoodDetails(String foodId)async{
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.http(Config.apiUrl, "${Config.foodApi}/$foodId");
    var response = await client.get(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return Food.fromJson(data["data"]);
    }else{
      return null;
    }
  }

  

  Future<Cart?> getCart()async{
    final idToken = await user!.getIdToken(true);
    Map<String, String> requestHeaders = {'Content-Type': 'application/json', 'Authorization': "Bearer $idToken"};

    var url = Uri.http(Config.apiUrl, Config.cartApi);
    var response = await client.get(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return Cart.fromJson(data["data"]);
    }else if(response.statusCode == 401){
      navigatorKey.currentState?.pushNamedAndRemoveUntil("/login", (route) => false);
    }else{
      return null;
    }
  }

  Future<bool?> addCartItem(foodId, quantity)async{
    final idToken = await user!.getIdToken(true);
    Map<String, String> requestHeaders = {'Content-Type': 'application/json', 'Authorization': 'Bearer $idToken'};

    var url = Uri.http(Config.apiUrl, Config.cartApi);
    var response = await client.post(
      url, 
      headers: requestHeaders,
      body: jsonEncode(
        {
          "foods": [
            {
              "food": foodId,
              "quantity": quantity
            }
          ]
        }
      )
    );
    if (response.statusCode == 200) {
      return true;
    }else if(response.statusCode == 401){
      navigatorKey.currentState?.pushNamedAndRemoveUntil("/login", (route) => false);
    }else{
      return null;
    }
  }

  Future<bool?> removeCartItem(foodId, quantity)async{
    final idToken = await user!.getIdToken(true);
    Map<String, String> requestHeaders = {'Content-Type': 'application/json', 'Authorization': 'Bearer $idToken'};

    var url = Uri.http(Config.apiUrl, Config.cartApi);
    var response = await client.delete(
      url, 
      headers: requestHeaders,
      body: jsonEncode(
        {
          "foodId": foodId,
          "quantity": quantity
        }
      )
    );
    if (response.statusCode == 200) {
      return true;
    }else if(response.statusCode == 401){
      navigatorKey.currentState?.pushNamedAndRemoveUntil("/login", (route) => false);
    }else{
      return null;
    }
  }

  Future<bool?> cleanCart()async{
    final idToken = await user!.getIdToken(true);
    Map<String, String> requestHeaders = {'Content-Type': 'application/json', 'Authorization': 'Bearer $idToken'};

    var url = Uri.http(Config.apiUrl, Config.cartDeleteAllApi);
    var response = await client.delete(
      url, 
      headers: requestHeaders,
    );
    if (response.statusCode == 200) {
      return true;
    }else if(response.statusCode == 401){
      navigatorKey.currentState?.pushNamedAndRemoveUntil("/login", (route) => false);
    }else{
      return null;
    }
  }


  Future<List<Address>?> getAddress()async{
    final idToken = await user!.getIdToken(true);
    Map<String, String> requestHeaders = {'Content-Type': 'application/json', 'Authorization': "Bearer $idToken"};

    var url = Uri.http(Config.apiUrl, Config.addressApi);
    var response = await client.get(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return addressesFromJson(data["data"]);
    }else {
      return null;
    }
  }

  Future<bool?> addAddress(city, house, street)async{
    final idToken = await user!.getIdToken(true);
    Map<String, String> requestHeaders = {'Content-Type': 'application/json', 'Authorization': 'Bearer $idToken'};

    var url = Uri.http(Config.apiUrl, Config.addressApi);
    var response = await client.post(
      url, 
      headers: requestHeaders,
      body: jsonEncode(
        {
          "city": city,
          "house": house,
          "street": street
        }
      )
    );
    if (response.statusCode == 200) {
      return true;
    }else{
      return null;
    }
  }

  Future<bool?> removeAddress(id)async{
    final idToken = await user!.getIdToken(true);
    Map<String, String> requestHeaders = {'Content-Type': 'application/json', 'Authorization': 'Bearer $idToken'};

    var url = Uri.http(Config.apiUrl, '${Config.addressApi}/$id');
    var response = await client.delete(
      url, 
      headers: requestHeaders,
    );
    if (response.statusCode == 200) {
      return true;
    }else{
      return null;
    }
  }

  Future<bool?> updateAddress(addressId, city, house, street)async{
    final idToken = await user!.getIdToken(true);
    Map<String, String> requestHeaders = {'Content-Type': 'application/json', 'Authorization': 'Bearer $idToken'};

    var url = Uri.http(Config.apiUrl, '${Config.addressApi}/$addressId');
    var response = await client.put(
      url, 
      headers: requestHeaders,
      body: jsonEncode(
        {
          "city": city,
          "house": house,
          "street": street
        }
      )
    );
    if (response.statusCode == 200) {
      return true;
    }else{
      return null;
    }
  }


  Future<Favorite?> getFavorites()async{
    final idToken = await user!.getIdToken(true);
    Map<String, String> requestHeaders = {'Content-Type': 'application/json', 'Authorization': "Bearer $idToken"};

    var url = Uri.http(Config.apiUrl, Config.favoriteApi);
    var response = await client.get(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return Favorite.fromJson(data["data"]);
    }else if(response.statusCode == 401){
      navigatorKey.currentState?.pushNamedAndRemoveUntil("/login", (route) => false);
    }else{
      return null;
    }
  }

  Future<bool?> addFavorites(foodId)async{
    final idToken = await user!.getIdToken(true);
    Map<String, String> requestHeaders = {'Content-Type': 'application/json', 'Authorization': 'Bearer $idToken'};

    var url = Uri.http(Config.apiUrl, Config.favoriteApi);
    var response = await client.post(
      url, 
      headers: requestHeaders,
      body: jsonEncode(
        {
          "foods": [
            {
              "food": foodId,
            }
          ]
        }
      )
    );
    if (response.statusCode == 200) {
      return true;
    }else if(response.statusCode == 401){
      navigatorKey.currentState?.pushNamedAndRemoveUntil("/login", (route) => false);
    }else{
      return null;
    }
  }

  Future<bool?> removeFavorites(foodId)async{
    final idToken = await user!.getIdToken(true);
    Map<String, String> requestHeaders = {'Content-Type': 'application/json', 'Authorization': 'Bearer $idToken'};

    var url = Uri.http(Config.apiUrl, Config.favoriteApi);
    var response = await client.delete(
      url, 
      headers: requestHeaders,
      body: jsonEncode(
        {
          "foodId": foodId,
        }
      )
    );
    if (response.statusCode == 200) {
      return true;
    }else if(response.statusCode == 401){
      navigatorKey.currentState?.pushNamedAndRemoveUntil("/login", (route) => false);
    }else{
      return null;
    }
  }

  // Future<Food?> searchFood(String key)async{
  //   Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
  //   var url = Uri.http(Config.apiUrl, Config.searchApi + "/" + key);
  //   var response = await client.get(url, headers: requestHeaders);
  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body);
  //     return Food.fromJson(data["data"]);
  //   }else{
  //     return null;
  //   }
  // }

  // Future<Restaurant?> searchRestaurant(String key)async{
  //   Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
  //   var url = Uri.http(Config.apiUrl, Config.searchResApi + "/" + key);
  //   var response = await client.get(url, headers: requestHeaders);
  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body);
  //     return Restaurant.fromJson(data["data"]);
  //   }else{
  //     return null;
  //   }
  // }

  Future<List<Restaurant>?> searchRestaurant(String key)async{
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    var url = Uri.http(Config.apiUrl, "${Config.searchResApi}/$key");
    var response = await client.get(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return restaurantsFromJson(data["data"]);
    }else{
      return null;
    }
  }
}