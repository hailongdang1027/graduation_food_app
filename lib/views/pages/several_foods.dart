import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:order_food/models/food_model.dart';
import 'package:order_food/models/food_pagination.dart';
import 'package:order_food/models/page_model.dart';
import 'package:order_food/provider/provider.dart';
import 'package:order_food/views/common_widget/most_food_card.dart';

class SeveralFoods extends ConsumerWidget {
  SeveralFoods(
    // this.relatedDetailFoods,
    {Key? key}
  ) : super(key: key);
  // List<String> relatedDetailFoods;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Text("Several foods", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
          // Visibility(
          //   visible: relatedDetailFoods.isNotEmpty,
          //   child: _foodList(ref),
          // )
          _foodList(ref)
        ]
      ),
    );
  }

  Widget _foodList(WidgetRef ref){
    final foods = ref.watch(relateFoodsProvider(
      FoodPaginationModel(
        pageModel: PageModel(page: 1, pageSize: 10),
        // foodIds: relatedDetailFoods
      )
    ));
    return foods.when(
      data: (list){
        return _buildFood(list!);
      }, 
      error: (_,__) => const Center(
        child: Text('error'),
      ), 
      loading: () => const Center(
        child: CircularProgressIndicator(),
      )
    );
  }

  Widget _buildFood(List<Food> foods){
   return Container(
    height: 200,
    alignment: Alignment.centerLeft,
    child: ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.zero,
      itemCount: foods.length,
      itemBuilder: (context, index) {
        var data = foods[index];
        return GestureDetector(
          onTap: (){
            
          },
          child: MostFoodCard(
            foodModel: data
          ),
        );
      } 
      )
    );
  }
}