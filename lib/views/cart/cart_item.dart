import 'package:flutter/material.dart';
import 'package:order_food/config/config.dart';
import 'package:order_food/models/cart_food.dart';
import 'package:order_food/models/food_model.dart';
import 'package:order_food/views/common_widget/custom_stepper.dart';

class CartItem extends StatefulWidget {
  const CartItem(
      {required this.model, this.quantityUpdate, this.itemRemove, super.key});

  final CartFood model;
  final Function? quantityUpdate;
  final Function? itemRemove;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: cartItemUI(context),
      ),
    );
  }

  Widget cartItemUI(BuildContext context){
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 10, 5),
          child: Container(
            width: 50,
            alignment: Alignment.center,
            child: Image.network(
              widget.model.food.foodImage != ""
                  ? widget.model.food.imagePath
                  : "",
              height: 100,
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.model.food.foodName,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${widget.model.food.foodPrice.toString()} ${Config.currency}",
              style: const TextStyle(
                  color: Colors.redAccent, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomStepper(
                  lower: 1, 
                  upper: 30, 
                  stepVal: 1, 
                  iconSize: 15.0, 
                  value: widget.model.quantity.toInt(), 
                  onChanged: (value){
                    widget.quantityUpdate!(widget.model, value["quantity"], value["handle"]);
                  }
                )
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: () {
                widget.itemRemove!(widget.model);
              },
              child: const Text(
                "Delete",
                style: TextStyle(fontSize: 16),
              )),
        )
      ],
    );
  }
}
