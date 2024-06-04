import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RememberMeController extends GetxController{
  final GetStorage storage = GetStorage();
  final RxBool rememberMe = false.obs;
  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  // GlobalKey<FormState> rememberFormKey = GlobalKey<FormState>();

}