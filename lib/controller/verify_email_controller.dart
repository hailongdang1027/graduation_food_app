import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();
  final _auth = FirebaseAuth.instance;


  Future sendVerification()async{
    try {
      await _auth.currentUser!.sendEmailVerification();
      print("Email verification sent!");
    } catch (e) {
      print("Error sending email verification: $e");
    }
  }
}