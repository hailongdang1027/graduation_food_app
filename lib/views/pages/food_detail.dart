import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:order_food/common/color.dart';
import 'package:order_food/config/config.dart';
import 'package:order_food/models/food_model.dart';
import 'package:order_food/models/food_pagination.dart';
import 'package:order_food/models/page_model.dart';
import 'package:order_food/provider/provider.dart';
import 'package:order_food/views/common_widget/custom_stepper.dart';
import 'package:order_food/views/common_widget/icon_app.dart';
import 'package:order_food/views/common_widget/most_food_card.dart';
import 'package:order_food/views/pages/food_detail_widget.dart';
import 'package:order_food/views/pages/several_foods.dart';

class FoodDetail extends ConsumerStatefulWidget {
  const FoodDetail({Key? key}) :super(key: key);

  @override
  _FoodDetailState createState() => _FoodDetailState();
}

class _FoodDetailState extends ConsumerState<FoodDetail> {
  String foodId = "";
  int quantity = 1;
  @override
  void didChangeDependencies() {
    final Map? arguments = ModalRoute.of(context)!.settings.arguments as Map;
    if (arguments != null) {
      foodId = arguments["foodId"];
      print(foodId);
    }
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: _foodDetails(ref),
        ),
      ),
    );
  }

  

  

  Widget _foodDetails(WidgetRef ref) {
    final foodDetails = ref.watch(foodDetailsProvider(foodId));
    
    return foodDetails.when(
        data: (model) {
          // print(model!.relatedDetailFoods);
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _foodDetailsView(model!),
              Row(
                children: [
                  CustomStepper(
                    lower: 1,
                    upper: 40,
                    stepVal: 1,
                    iconSize: 22,
                    value: quantity,
                    onChanged: (value) {
                      quantity = value["quantity"];
                    }
                  ),
                  const SizedBox(width: 20,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextButton.icon(
                          onPressed: () {
                            final cartViewModel = ref.read(cartItemsProvider.notifier);
                            cartViewModel.addCartItem(model.foodId, quantity);
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.green)),
                          icon: const Icon(Icons.shopping_basket),
                          label: Text(
                            "Add to cart",
                            style: TextStyle(color: ExtensionColor.white),
                          )),
                    )
                ],
              ),
              // _handleCartView(model),
              SeveralFoods(),
              const SizedBox(height: 10,)
            ],
          );
        },
        
        error: (_, __) => const Center(
              child: Text("error"),
            ),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }

  // Widget _handleCartView(Food foodModel){
  //   return ;
  // }
  

  // Widget _severalFoods(List<String> sevFoods){
  //   return Container(
  //     margin: EdgeInsets.all(10),
  //     child: Column(
  //       children: [
  //         const Text("Several foods", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
  //         Visibility(
  //           child: _foodList(ref, sevFoods),
  //           visible: sevFoods.isNotEmpty,
  //         )
  //       ]
  //     ),
  //   );
  // }

  // Widget _foodList(WidgetRef ref, List<String> sevFoods){
  //   final foods = ref.watch(relateFoodsProvider(
  //     FoodPaginationModel(
  //       pageModel: PageModel(page: 1, pageSize: 10),
  //       foodIds: sevFoods
  //     )
  //   ));
  //   return foods.when(
  //     data: (list){
  //       return _buildFood(list!);
  //     },
  //     error: (_,__) => const Center(
  //       child: Text('error'),
  //     ),
  //     loading: () => const Center(
  //       child: CircularProgressIndicator(),
  //     )
  //   );
  // }

  // Widget _buildFood(List<Food> foods){
  //  return Container(
  //   height: 200,
  //   alignment: Alignment.centerLeft,
  //   child: ListView.builder(
  //     shrinkWrap: true,
  //     physics: const ClampingScrollPhysics(),
  //     scrollDirection: Axis.vertical,
  //     itemCount: foods.length,
  //     itemBuilder: (context, index) {
  //       var data = foods[index];
  //       return GestureDetector(
  //         onTap: (){

  //         },
  //         child: MostFoodCard(
  //           foodModel: data
  //         ),
  //       );
  //     }
  //     )
  //   );
  // }

  Widget _foodDetailsView(Food foodModel) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                foodModel.imagePath,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodModel.foodName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [Text(foodModel.foodRating.toString())],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Price: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${foodModel.foodPrice.toString()}${Config.currency}",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          color: foodModel.calculationSale > 0
                            ?Colors.redAccent
                            : Colors.black,
                          decoration: foodModel.foodSalePrice > 0
                            ? TextDecoration.lineThrough
                            : null
                        ),
                      ),
                      Text(
                          (foodModel.calculationSale > 0)
                              ? " ${Config.currency}${foodModel.foodSalePrice.toString()}"
                              : "",
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black,fontWeight: FontWeight.w600))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    foodModel.foodDescription!,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconApp(iconData: Icons.arrow_back_ios),

              ],
            )),
      ],
    );
  }
}
