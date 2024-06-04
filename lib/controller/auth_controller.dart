import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  storeUserCard(String number, String expiry, String cvv, String name)async{
    await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid)
    .collection('cards')
    .add({
      'name': name,
      'number': number,
      'cvv': cvv,
      'expiry': expiry
    });
    return true;
  }

  RxList userCard = [].obs;
  getUserCards(){
    _firestore.collection('users')
    .doc(FirebaseAuth.instance.currentUser!.uid).collection('cards')
    .snapshots().listen((event) {
      userCard.value = event.docs;
    });
  }


  pickProfileImage(ImageSource source)async{
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);

    if (_file != null) {
      return await _file.readAsBytes();
    }else{
      print('No Image Selected');
    }
  }
   
}