import 'package:flutter/material.dart';
import 'package:order_food/views/tabview/main_tabview.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Success"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Order has been successful!"),
            Icon(Icons.celebration),
            ElevatedButton(
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainTabView()));
              }, 
              child: Text("Go to Main page", style: TextStyle(fontSize: 20),),
            )
          ],
        )
      ),
    );
  }
}