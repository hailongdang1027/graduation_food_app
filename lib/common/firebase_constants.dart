import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseContants {
  static const addressCollect = "address";
  static final addressRef = FirebaseFirestore.instance
  .collection("address")
  .doc(FirebaseAuth.instance.currentUser!.uid);
}