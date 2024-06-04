import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:order_food/provider/provider.dart';
import 'package:order_food/views/common_widget/most_food_card.dart';

class FoodCatList extends ConsumerWidget {
  const FoodCatList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodsState = ref.watch(foodsNotifierProvider);

    // _scrollController.addListener(() {
    //   if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
    //     final foodsView = ref.read(foodsNotifierProvider.notifier);
    //     final foodsStateContent = ref.watch(foodsNotifierProvider);
    //     if (foodsStateContent.isNext) {
    //       foodsView
    //     }
    //   }
    // });
    if (foodsState.foods.isEmpty) {
      if (!foodsState.isNext && !foodsState.isLoading) {
        return const Center(
          child: Text("No foods"),
        );
      }
      return const LinearProgressIndicator();
    }
    return RefreshIndicator(
      onRefresh: ()async{
        ref.read(foodsNotifierProvider.notifier).refreshFoods();
      },
      child: Column(
        children: [
          Flexible(
            flex: 1,
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                foodsState.foods.length, 
                (index){
                  return MostFoodCard(
                    foodModel: foodsState.foods[index]
                  );
                }
              ),
            )
          )
        ],
      ),
    );
  }
}