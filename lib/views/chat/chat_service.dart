import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:order_food/models/message.dart';

class ChatService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<List<Map<String, dynamic>>> getUserStream(){
    return _firebaseFirestore.collection("users").snapshots().map((snapshot){
      return snapshot.docs.map((e){
        final user = e.data();
        return user;
      }).toList();
    });
  }
  Future<void> sendMessage(String receiverId, message)async{
    final String currentUserId = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();
    Message newMessage = Message(senderId: currentUserId, senderEmail: currentUserEmail, receiverId: receiverId, message: message, timestamp: timestamp);
    List<String> ids = [currentUserId, receiverId];
    ids.sort();
    String chatRoomId = ids.join('_');
    await _firebaseFirestore.collection("chat_rooms").doc(chatRoomId).collection("messages").add(newMessage.toMap());
  }

  Future<Query<Map<String, dynamic>>> getMessage(String userId, adminId)async{
    List<String> ids = [userId, adminId];
    ids.sort();
    String chatRoomId = ids.join('_');
    return _firebaseFirestore.collection("chat_rooms").doc(chatRoomId).collection("messages").orderBy("timestamp", descending: false);
    //Error
  }

  
}