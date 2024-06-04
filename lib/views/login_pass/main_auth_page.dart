import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:order_food/views/login_pass/login_page.dart';
import 'package:order_food/views/login_pass/register_page.dart';
import 'package:order_food/views/login_pass/verify_email_page.dart';
import 'package:order_food/views/tabview/main_tabview.dart';

class MainAuthPage extends StatelessWidget {
  const MainAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          
          if (!snapshot.hasData) {
            return LoginPage();
          }else{
            if (snapshot.data!.emailVerified) {
              return MainTabView();
            }else{
              return const VerifyEmailPage();
            }
          }   
        },
      ),
    );
  }
}