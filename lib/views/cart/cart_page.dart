import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:order_food/config/config.dart';
import 'package:order_food/models/cart.dart';
import 'package:order_food/models/cart_food.dart';
import 'package:order_food/provider/provider.dart';
import 'package:order_food/views/cart/cart_item.dart';
import 'package:order_food/views/order_detail.dart';


class CartPage extends ConsumerStatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      bottomNavigationBar: const Checkout(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: _cartList(ref),
            )
            // _cartList(ref)
          ],
        ),
      ),
    );
  }

  Widget _cartItems(List<CartFood> cartFoods, WidgetRef ref){
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: cartFoods.length,
      itemBuilder: ((context, index) {
        return CartItem(
          model: cartFoods[index],
          quantityUpdate: (CartFood model, quantity, handle){
            final cartViewModel = ref.read(cartItemsProvider.notifier);
            cartViewModel.updateQuantity(model.food.foodId, quantity, handle);
          },
          itemRemove: (CartFood model){
            final cartViewModel = ref.read(cartItemsProvider.notifier);
            cartViewModel.removeCartItem(model.food.foodId, model.quantity);
          },
        );
      })
    );
  }

  Widget _cartList(WidgetRef ref){
    final cartState = ref.watch(cartItemsProvider);
    if (cartState.cartModel == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (cartState.cartModel!.foods.isEmpty) {
      return const Center(
        child: Text("Empty cart"),
      );
    }
    return _cartItems(cartState.cartModel!.foods, ref);
  }
}

class Checkout extends ConsumerWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartProvider = ref.watch(cartItemsProvider);
    if (cartProvider.cartModel != null) {
      return cartProvider.cartModel!.foods.isNotEmpty ?
      Container(
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10)
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total: ${cartProvider.cartModel!.grandTotal.toString()} ${Config.currency}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                ),
                const SizedBox(width: 40,),
                ElevatedButton.icon(onPressed: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => OrderDetail())
                  );
                }, icon: Icon(Icons.shopping_bag), label: Text("Submit", style: TextStyle(fontSize: 15),))
              ],
            ),
          ),
        ),
      ) : const SizedBox();
    }
    return const SizedBox();
  }
}
