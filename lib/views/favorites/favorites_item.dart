import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:order_food/common/color.dart';
import 'package:order_food/config/config.dart';
import 'package:order_food/models/favorite_food.dart';
import 'package:order_food/models/food_model.dart';

class FavoritesItem extends StatelessWidget {
  const FavoritesItem({
    required this.model,
    this.onItemRemove,
    super.key
  });
  final Function? onItemRemove;
  final FavoriteFood model;

  Widget favoritesItemUI(BuildContext context){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 10, 5),
          child: Container(
            width: 100,
            alignment: Alignment.center,
            child: Image.network(model.food.foodImage != "" ? model.food.imagePath : "", height: 50, fit: BoxFit.fill,),
          ),
        ),
        SizedBox(
          width: 250,
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.food.foodName, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                  Text("${model.food.foodPrice.toString()} ${Config.currency}", style: const TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold
                  ),),
                  
                ],
              ),
              const SizedBox(width: 20,),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: IconButton(
                  onPressed: (){
                    onItemRemove!(model);
                  }, 
                  icon: const Icon(Icons.delete, color: Colors.red,)
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: ExtensionColor.white),
        child: favoritesItemUI(context),
      ),
    );
  }
}