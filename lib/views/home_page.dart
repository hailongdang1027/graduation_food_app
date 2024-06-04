
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:order_food/models/category_model.dart';
import 'package:order_food/models/food_model.dart';
import 'package:order_food/models/food_pagination.dart';
import 'package:order_food/models/page_model.dart';
import 'package:order_food/provider/provider.dart';
import 'package:order_food/views/common_widget/most_food_card.dart';
import 'package:order_food/views/menu/navbar/nav_bar.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // List<Food> list = List<Food>.empty(growable: true);
    // list.add(Food(
    //     foodId: "661fda4f756d95dc93c4b649",
    //     category: Category(
    //         categoryId: "661e852e5ec6f4e5902c888d",
    //         categoryName: "Banh Cuon",
    //         categoryImage:"/uploads/categories/1713276206720--buncha.jpg"
    //     ),
    //     foodName: "Banh Cay",
    //     foodDescription: "Banh Cay Dac Biet Ne",
    //     foodImage:
    //         "/uploads/foods/1713363535332--banhcuon.jpg",
    //     foodPrice: 2440,
    //     foodSalePrice: 0.0,
    //     foodRating: 4.4));

    // list.add(Food(
    //     foodId: "",
    //     category: Category(
    //         categoryId: "661e852e5ec6f4e5902c888d",
    //         categoryName: "Banh Cuon",
    //         categoryImage:"/uploads/categories/1713276206720--buncha.jpg"
    //     ),
    //     foodName: "Bun Cha Nuong",
    //     foodDescription: "Great Bun Cha Viet Nam",
    //     foodImage:
    //         "/uploads/foods/1713281609876--bunchanuong.jpg",
    //     foodPrice: 400,
    //     foodSalePrice: 370,
    //     foodRating: 4.4));

    //   list.add(Food(
    //     foodId: "",
    //     category: Category(
    //         categoryId: "661e852e5ec6f4e5902c888d",
    //         categoryName: "Banh Cuon",
    //         categoryImage:"/uploads/categories/1713276206720--buncha.jpg"
    //     ),
    //     foodName: "Bun Cha Nuong",
    //     foodDescription: "Great Bun Cha Viet Nam",
    //     foodImage:
    //         "/uploads/foods/1713281609876--bunchanuong.jpg",
    //     foodPrice: 400,
    //     foodSalePrice: 370,
    //     foodRating: 4.4));

    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text("Menu"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  // child: ProviderScope(
                  //   child: Consumer(builder: (context, ref, _) {
                  //     final categories = ref.watch(
                  //         categoriesProvider(PageModel(page: 1, pageSize: 10)));
                  //     return categories.when(
                  //       data: (list) {
                  //         return _buildCategoryList(list!, ref);
                  //       },
                  //       error: (_, __) => const Center(
                  //         child: Text("Error"),
                  //       ),
                  //       loading: () => const Center(
                  //         child: CircularProgressIndicator(),
                  //       ),
                  //     );
                  //   }),
                  // )
                  child: _categoryContentList(ref),
                ),
              const SizedBox(
                height: 8,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Divider(
                  height: 1,
                  thickness: 1,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                // child: _searchContentFood(ref),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                // child: ProviderScope(
                //     child: Consumer(builder: (context, ref, _) {
                //       final foods = ref.watch(foodsProvider(FoodPaginationModel(
                //           pageModel: PageModel(page: 1, pageSize: 10))));
                //       return foods.when(
                //         data: (list) {
                //           return _buildFoodList(list!);
                //         },
                //         error: (_, __) => const Center(
                //           child: Text("Error"),
                //         ),
                //         loading: () => const Center(
                //           child: CircularProgressIndicator(),
                //         ),
                //       );
                //     }
                //   ),
                // )
                child: _foodContentList(ref),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _searchContentFood(WidgetRef ref){
  //   final searchResults = ref.watch(searchProvider(txtSearch.text));
  //   return searchResults.when(
  //     data: (results) {
  //       if (results == null) {
  //         return const Center(child: Text("No results found."));
  //       }else{
  //         // return ListView.builder(
  //         //   itemCount: results.length,
  //         //   itemBuilder: ((context, index) {
              
  //         //   })
  //         // );
  //         return ListTile(
  //               title: Text(results.foodName),
  //         );
  //       }
  //     },
  //     error: (_, __) => const Center(
  //       child: Text("Error"),
  //     ),
  //     loading: () => const Center(
  //       child: CircularProgressIndicator(),
  //     ),
  //   );
  // }

  Widget _foodContentList(WidgetRef ref){
    final foods = ref.watch(foodsProvider(FoodPaginationModel(
      pageModel: PageModel(page: 1, pageSize: 10))));
    return foods.when(
      data: (list) {
        return Column(
          children: [
            _buildFoodList(list!),
          ],
        );
      },
      error: (_, __) => const Center(
        child: Text("Error"),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _categoryContentList(WidgetRef ref){
  final categories = ref.watch(
    categoriesProvider(PageModel(page: 1, pageSize: 10)));
    return categories.when(
      data: (list) {
        return _buildCategoryList(list!, ref);
      },
      error: (_, __) => const Center(
        child: Text("Error"),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildFoodList(List<Food> foods) {
    return Container(
      height: 200,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
          itemCount: foods.length,
          itemBuilder: ((context, index) {
            var data = foods[index];
            return GestureDetector(
              onTap: () {
                
              },
              child: MostFoodCard(foodModel: data),
            );
          })),
    );
  }

  Widget _buildCategoryList(List<Category> categories, WidgetRef ref) {
    
    return SizedBox(
      height: 140,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            var data = categories[index];
            return GestureDetector(
              onTap: (){
                FoodPaginationModel paginationModel = FoodPaginationModel(
                  pageModel: PageModel(page: 1, pageSize: 10),
                  categoryId: data.categoryId
                );
                
                ref
                .read(foodsFilterProvider.notifier)
                .setFoodFilter(paginationModel);
                ref.read(foodsNotifierProvider.notifier).getFoods();
                Navigator.of(context).pushNamed("/foods", arguments: {
                  'categoryId': data.categoryId,
                  'categoryName': data.categoryName
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.all(8),
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        child: Image.network(
                          data.imagePath,
                          height: 50,
                        )
                        // color: Colors.blue,
                        ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(data.categoryName,
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold))
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}




