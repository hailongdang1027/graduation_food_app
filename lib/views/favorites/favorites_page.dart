import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:order_food/models/favorite_food.dart';
import 'package:order_food/provider/provider.dart';
import 'package:order_food/views/favorites/favorites_item.dart';

class FavoritesPage extends ConsumerStatefulWidget {
  const FavoritesPage({super.key});

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends ConsumerState<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
      ),
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: _favoriteList(ref)
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFavoriteItems(List<FavoriteFood> favorFoods, WidgetRef ref){
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: favorFoods.length,
      itemBuilder: (context, index){
        return FavoritesItem(
          model: favorFoods[index],
          onItemRemove: (FavoriteFood model){
            final favoritesModel = ref.read(favoriteItemsProvider.notifier);
            favoritesModel.removeFavoritesFood(model.food.foodId);
          },
        );
      }
    );
  }

  Widget _favoriteList(WidgetRef ref){
    final favorState = ref.watch(favoriteItemsProvider);

    if (favorState.favoriteModel == null) {
      return const LinearProgressIndicator();
    }
    if (favorState.favoriteModel!.foods.isEmpty) {
      return const Center(
        child: Text("Favorites Empty"),
      );
    }
    return _buildFavoriteItems(favorState.favoriteModel!.foods, ref);
  }
}