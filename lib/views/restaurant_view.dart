import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:order_food/common/color.dart';
import 'package:order_food/models/page_model.dart';
import 'package:order_food/provider/provider.dart';

import '../models/restaurant.dart';

class RestaurantView extends ConsumerWidget {
  TextEditingController txtSearch = TextEditingController();

  RestaurantView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: txtSearch,
                  decoration: InputDecoration(
                    labelText: "Search",
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        ref.refresh(searchRestaurantProvider(txtSearch.text));
                        _searchRestaurantList(ref);
                      },
                    ),
                  ),
                  onChanged: (val){
                     ref.refresh(searchRestaurantProvider(val));
                  },
                  onSubmitted: (value){
                    ref.refresh(searchRestaurantProvider(value));
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              
              _restaurantList(ref)
            ],
          ),
        ),
      ),
    );
  }

  Widget _restaurantList(WidgetRef ref) {
    final restaurants = ref.watch(
      restaurantsProvider(PageModel(page: 1, pageSize: 10)),
    );
    return restaurants.when(
        data: (list) {
          return _buildRestaurantList(list!);
        },
        error: (_, __) => const Center(
              child: Text("Error"),
            ),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }

  Widget _searchRestaurantList(WidgetRef ref) {
    final restaurants = ref.watch(searchRestaurantProvider(txtSearch.text));
    return restaurants.when(
        data: (result) {
          if (result != null) {
            return ListView.builder(
                itemCount: result.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    title: Text(result[index].restaurantName),
                  );
                }));
          } else {
            return const Text("No results");
          }
        },
        error: (_, __) => const Center(
              child: Text("Error"),
            ),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }

  Widget _buildRestaurantList(List<Restaurant> restaurants) {
    return ListView.builder(
        itemCount: restaurants.length,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var data = restaurants[index];
          return GestureDetector(
            onTap: () {},
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      child: Image.network(
                        data.resImagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        width: 60,
                        height: 30,
                        decoration: BoxDecoration(
                            color: ExtensionColor.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            data.restaurantRating.toString(),
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      data.restaurantName,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(data.restaurantDescription,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      data.restaurantAddress,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }
}
