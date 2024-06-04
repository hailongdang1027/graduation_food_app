import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_food/views/login_pass/main_auth_page.dart';
import 'package:order_food/views/tabview/main_tabview.dart';

import '../../controller/verify_email_controller.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  final VerifyEmailController _verifyEmailController =
      Get.put(VerifyEmailController());

  bool canSendEmail = false;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    _verifyEmailController.sendVerification();
      timer = Timer.periodic(Duration(seconds: 3), (_) => checkEmailVerified());
    
  }

  

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    
    if (FirebaseAuth.instance.currentUser!.emailVerified) {
      timer?.cancel();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MainAuthPage()));
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                'Open your email and verify',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30,),
              ElevatedButton(
                onPressed: ()async{
                  _verifyEmailController.sendVerification();
                }, 
                child: const Text("Resend Email")
              )
            ],
          ),
        ),
      ),
    );
  }

      
}
