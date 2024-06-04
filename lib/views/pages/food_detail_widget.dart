// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:order_food/views/pages/several_foods.dart';

// import '../../config/config.dart';
// import '../../models/food_model.dart';
// import '../../provider/provider.dart';
// import '../common_widget/icon_app.dart';

// class FoodDetailWidget extends ConsumerWidget {
//   FoodDetailWidget({super.key});
//   String foodId = "";

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Container(
//       child: _foodDetails(ref),
//     );
//   }

//   Widget _foodDetails(WidgetRef ref) {
//     final foodDetails = ref.watch(foodDetailsProvider(foodId));
//     return foodDetails.when(
//         data: (model) {
//           return Column(
//             children: [
//               _foodDetailsView(model!),
//               // SeveralFoods(model.relatedDetailFoods!),
//               // SizedBox(height: 10,)
//             ],
//           );
//         },
        
//         error: (_, __) => const Center(
//               child: Text("error"),
//             ),
//         loading: () => const Center(
//               child: CircularProgressIndicator(),
//             ));
//   }

//   Widget _foodDetailsView(Food foodModel) {
//     return Stack(
//       children: [
//         Column(
//           children: [
//             Container(
//               height: 200,
//               width: 400,
//               child: Image.network(
//                 foodModel.imagePath,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Padding(
//               padding: EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     foodModel.foodName,
//                     style: const TextStyle(
//                         fontWeight: FontWeight.bold, fontSize: 22),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     children: [Text(foodModel.foodRating.toString())],
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Row(
//                     children: [
//                       const Text(
//                         "Price: ",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 16),
//                       ),
//                       const SizedBox(
//                         width: 5,
//                       ),
//                       Text(
//                           (foodModel.calculationSale > 0)
//                               ? " ${Config.currency}${foodModel.foodPrice.toString()}"
//                               : "",
//                           style: const TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.w600))
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Text(
//                     foodModel.foodDescription!,
//                     style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   const Divider(
//                     height: 1,
//                     thickness: 1,
//                     color: Colors.black,
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Rating",
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.w600),
//                       ),
//                       // IconButton(
//                       //     onPressed: () {
//                       //       Navigator.push(
//                       //           context,
//                       //           MaterialPageRoute(
//                       //             builder: (context) => ReviewDetailView(),
//                       //           ));
//                       //     },
//                       //     icon: Icon(Icons.arrow_forward))
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   const Divider(
//                     height: 1,
//                     thickness: 1,
//                     color: Colors.black,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         Padding(
//             padding: EdgeInsets.only(left: 15, right: 15, top: 20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 IconApp(iconData: Icons.arrow_back_ios),
//                 IconApp(iconData: Icons.shopping_cart_outlined)
//               ],
//             )),
//       ],
//     );
//   }
// }

// // class FoodDetailWidget extends ConsumerStatefulWidget {
// //   const FoodDetailWidget({super.key});

// //   @override
// //   _FoodDetailWidgetState createState() => _FoodDetailWidgetState();
// // }

// // class _FoodDetailWidgetState extends ConsumerState<FoodDetailWidget> {
// //   String foodId = "";

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       child: Consumer(
// //         builder: (context, watch, _){
// //           return _foodDetails(ref);
// //         },
// //       )
// //     );
// //   }

// //   Widget _foodDetails(WidgetRef ref) {
// //     final foodDetails = ref.watch(foodDetailsProvider(foodId));
// //     return foodDetails.when(
// //         data: (model) {
// //           return Column(
// //             children: [
// //               _foodDetailsView(model!),
// //               // SeveralFoods(model.relatedDetailFoods!)
// //             ],
// //           );
// //         },
        
// //         error: (_, __) => const Center(
// //               child: Text("error"),
// //             ),
// //         loading: () => const Center(
// //               child: CircularProgressIndicator(),
// //             ));
// //   }

// //   Widget _foodDetailsView(Food foodModel) {
// //     return Stack(
// //       children: [
// //         Column(
// //           children: [
// //             Container(
// //               height: 200,
// //               width: 400,
// //               child: Image.network(
// //                 foodModel.imagePath,
// //                 fit: BoxFit.cover,
// //               ),
// //             ),
// //             const SizedBox(
// //               height: 10,
// //             ),
// //             Padding(
// //               padding: EdgeInsets.all(20),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Text(
// //                     foodModel.foodName,
// //                     style: const TextStyle(
// //                         fontWeight: FontWeight.bold, fontSize: 22),
// //                   ),
// //                   const SizedBox(
// //                     height: 10,
// //                   ),
// //                   Row(
// //                     children: [Text(foodModel.foodRating.toString())],
// //                   ),
// //                   const SizedBox(
// //                     height: 15,
// //                   ),
// //                   Row(
// //                     children: [
// //                       const Text(
// //                         "Price: ",
// //                         style: TextStyle(
// //                             fontWeight: FontWeight.bold, fontSize: 16),
// //                       ),
// //                       const SizedBox(
// //                         width: 5,
// //                       ),
// //                       Text(
// //                           (foodModel.calculationSale > 0)
// //                               ? " ${Config.currency}${foodModel.foodPrice.toString()}"
// //                               : "",
// //                           style: const TextStyle(
// //                               fontSize: 16, fontWeight: FontWeight.w600))
// //                     ],
// //                   ),
// //                   const SizedBox(
// //                     height: 20,
// //                   ),
// //                   Text(
// //                     foodModel.foodDescription,
// //                     style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
// //                   ),
// //                   const SizedBox(
// //                     height: 15,
// //                   ),
// //                   const Divider(
// //                     height: 1,
// //                     thickness: 1,
// //                     color: Colors.black,
// //                   ),
// //                   const SizedBox(
// //                     height: 15,
// //                   ),
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// //                       Text(
// //                         "Rating",
// //                         style: TextStyle(
// //                             fontSize: 20, fontWeight: FontWeight.w600),
// //                       ),
// //                       // IconButton(
// //                       //     onPressed: () {
// //                       //       Navigator.push(
// //                       //           context,
// //                       //           MaterialPageRoute(
// //                       //             builder: (context) => ReviewDetailView(),
// //                       //           ));
// //                       //     },
// //                       //     icon: Icon(Icons.arrow_forward))
// //                     ],
// //                   ),
// //                   const SizedBox(
// //                     height: 15,
// //                   ),
// //                   const Divider(
// //                     height: 1,
// //                     thickness: 1,
// //                     color: Colors.black,
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //         Padding(
// //             padding: EdgeInsets.only(left: 15, right: 15, top: 20),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 IconApp(iconData: Icons.arrow_back_ios),
// //                 IconApp(iconData: Icons.shopping_cart_outlined)
// //               ],
// //             )),
// //       ],
// //     );
// //   }
// // }