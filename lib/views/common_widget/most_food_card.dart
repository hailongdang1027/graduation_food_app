import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:order_food/common/color.dart';
import 'package:order_food/provider/provider.dart';
import '../../models/food_model.dart';

class MostFoodCard extends ConsumerStatefulWidget {
  final Food foodModel;
  const MostFoodCard({super.key, required this.foodModel,});

  @override
  _MostFoodCardState createState() => _MostFoodCardState();
}

class _MostFoodCardState extends ConsumerState<MostFoodCard> {
  bool _isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      width: 150,
      decoration: const BoxDecoration(color: Colors.white),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                visible: widget.foodModel!.calculationSale > 0,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Colors.green
                    ),
                    child: Text(
                      "${widget.foodModel!.calculationSale}%",
                      style: TextStyle(
                        color: ExtensionColor.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                )
              ),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pushNamed(
                    "/food-details",
                    arguments: {'foodId': widget.foodModel!.foodId}
                  );
                },
                child: SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    widget.foodModel!.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8,left: 10),
                child: Text(
                  widget.foodModel!.foodName,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),  
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Text(
                            widget.foodModel!.foodPrice.toString(),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 12, 
                              color: widget.foodModel!.calculationSale > 0 ? Colors.redAccent : Colors.black,
                              fontWeight: FontWeight.bold,
                              decoration: widget.foodModel!.foodSalePrice > 0 ? TextDecoration.lineThrough : null
                            ),
                          ),
                          Text(
                            (widget.foodModel!.calculationSale > 0) ? " ${widget.foodModel!.foodSalePrice.toString()}" : "",
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 12, 
                              color: Colors.black, 
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      )
                    ),
                    GestureDetector(
                      child: Icon( _isLiked ? Icons.favorite : Icons.favorite_border,
                        color: _isLiked ? Colors.red : Colors.black,
                        size: 20,
                      ),
                      onTap: (){
                        setState(() {
                          _isLiked = !_isLiked;
                          final favorViewModel = ref.read(favoriteItemsProvider.notifier);
                          if (_isLiked) {
                            favorViewModel.addFavoritesFood(widget.foodModel.foodId);
                          }else{
                            favorViewModel.removeFavoritesFood(widget.foodModel.foodId);
                          }
                        });
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
