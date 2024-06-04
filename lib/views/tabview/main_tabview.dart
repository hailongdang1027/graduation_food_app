import 'package:flutter/material.dart';
import 'package:order_food/common/color.dart';
import 'package:order_food/views/cart/cart_page.dart';
import 'package:order_food/views/common_widget/tab_button.dart';
import 'package:order_food/views/home_page.dart';
import 'package:order_food/views/restaurant_view.dart';
import 'package:order_food/views/other/other_page.dart';
import 'package:order_food/views/profile/profile_page.dart';
import 'package:order_food/views/search_page.dart';

class MainTabView extends StatefulWidget {
  
  @override
  _MainTabViewState createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int selectTab = 2;
  PageStorageBucket storageBucket = PageStorageBucket();
  Widget selectPageView = HomePage();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: PageStorage(bucket: storageBucket, child: selectPageView,),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          
          width: 45,
          height: 45,
          child: FloatingActionButton(
            
            shape: const CircleBorder(),
            onPressed: () {
              if (selectTab != 2) {
                selectTab = 2;
                selectPageView = HomePage();
              }
              if (mounted) {
                setState(() {
                  
                });
              }
            },
            backgroundColor: selectTab == 2 ? ExtensionColor.primary : ExtensionColor.placeholder,
            child: Container(
              alignment: Alignment.center,
              child: Image.asset("assets/img/tab_home.png", width: 20, height: 20,)
            )
            
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: ExtensionColor.white,
        surfaceTintColor: ExtensionColor.white,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        elevation: 1,
        notchMargin: 12,
        height: 64,
        shape: const CircularNotchedRectangle(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TabButton(
                  onTap: () {
                  if (selectTab != 0) {
                    selectTab = 0;
                    selectPageView = RestaurantView();
                  }
                  if (mounted) {
                    setState(() {
                      
                    });
                  }
                }, title: "Restaurant", icon: "assets/img/tab_menu.png", isChoosed: selectTab == 0,
                ),
                const SizedBox(width: 30, height: 30,),
                TabButton(onTap: () {
                  if (selectTab != 1) {
                    selectTab = 1;
                    selectPageView = const CartPage();
                  }
                  if (mounted) {
                    setState(() {
                      
                    });
                  }
                }, title: "Cart", icon: "assets/img/shopping_cart.png", isChoosed: selectTab == 1),
                const SizedBox(width: 30, height: 30,),
                TabButton(onTap: () {
                  if (selectTab != 3) {
                    selectTab = 3;
                    selectPageView = ProfilePage();
                  }
                  if (mounted) {
                    setState(() {
                      
                    });
                  }
                }, title: "Contact", icon: "assets/img/tab_profile.png", isChoosed: selectTab == 3),
                const SizedBox(width: 30, height: 30,),
                TabButton(onTap: () {
                  if (selectTab != 4) {
                    selectTab = 4;
                    selectPageView = OtherPage();
                  }
                  if (mounted) {
                    setState(() {
                      
                    });
                  }
                }, title: "Other", icon: "assets/img/tab_more.png", isChoosed: selectTab == 4),
                const SizedBox(width: 30, height: 30,),
                TabButton(onTap: () {
                  if (selectTab != 5) {
                    selectTab = 5;
                    selectPageView = Container();
                  }
                  if (mounted) {
                    setState(() {
                      
                    });
                  }
                }, title: "Search", icon: "assets/img/search.png", isChoosed: selectTab == 5),
                
              ],
            ),
          ),
        ),
      ),
      
    );
  }
}