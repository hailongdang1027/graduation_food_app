import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:order_food/provider/provider.dart';
import 'package:order_food/views/common_widget/food_cat_list.dart';

class FoodsPage extends StatefulWidget {
  const FoodsPage({super.key});

  @override
  State<FoodsPage> createState() => _FoodsPageState();
}

class _FoodsPageState extends State<FoodsPage> {
  String? categoryId;
  String? categoryName;
  @override
  void didChangeDependencies(){
    final Map? arguments = ModalRoute.of(context)!.settings.arguments as Map;
    if (arguments != null) {
      categoryId = arguments['categoryId'];
      categoryName = arguments['categoryName'];
    }
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController txtSearch = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Foods"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              
            },
          )
        ],
      ),
      
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _FoodFilters(
                categoryId: categoryId,
                categoryName: categoryName,
              ),
              const SizedBox(height: 10,),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   child: TextField(
              //     controller: txtSearch,
              //     decoration: InputDecoration(
              //       labelText: "Search",
              //       suffixIcon: IconButton(
              //         icon: const Icon(Icons.search),
              //         onPressed: () {
              //           // ref.refresh(searchProvider(txtSearch.text));
              //         },
              //       )
              //     ),
              //   ),
              // ),
              const SizedBox(height: 20,),
              const Flexible(
                flex: 1,
                child: ProviderScope(child: FoodCatList()),
              )
            ],
          ),
        ),
      )
    );

    
  }
}

class _FoodFilters extends ConsumerWidget{
  const _FoodFilters({
    Key? key,
    this.categoryName,
    this.categoryId
  });
  final String? categoryName;
  final String? categoryId;
  @override
  Widget build(BuildContext context, WidgetRef ref){
    return RefreshIndicator(
      onRefresh: ()async{
        ref.read(foodsNotifierProvider.notifier).refreshFoods();
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Text(
          categoryName!,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}