import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:order_food/common/color.dart';
import 'package:order_food/notifications_network/notifications.dart';
import 'package:order_food/views/favorites/favorites_page.dart';
import 'package:order_food/views/login_pass/login_page.dart';
import 'package:order_food/views/login_pass/new_password.dart';


class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(user.email!), 
            accountEmail: Text(user.email!),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset("assets/img/user_profile.png",
                  fit: BoxFit.cover,
                )
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favorites'),
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const FavoritesPage())
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text('Change Password'),
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const NewPassword())
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share'),
            onTap: (){},
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) =>NotificationsApp() )
              );
            },
            trailing: Container(
              color: Colors.redAccent,
              width: 20,
              height: 20,
              child: Center(
                child: Text(
                  "10",
                  style: TextStyle(
                    color: ExtensionColor.white,
                    fontSize: 12
                  ),
                )
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                    builder: (context){
                      return Container();
                    }
                )
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Sign out'),
            onTap: ()async{
              
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(context, 
                MaterialPageRoute(builder: (context) => const LoginPage())
              );
            },
          ),
        ],
      ),
    );
  }
}