import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:order_food/views/chat/chat_bottom_sheet.dart';
import 'package:order_food/views/chat/chat_service.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon: Icon(Icons.arrow_back)
        ),
        title: Text("Message"),
      ),
      // body: ListView(
      //   padding: EdgeInsets.all(20),
      //   children: [
      //     ChatContact(),
      //     ChatContact(),
      //     ChatContact(),
      //     ChatContact(),
      //     ChatContact()
      //   ],
         
      // ),
      body: StreamBuilder(
        stream: ChatService().getUserStream(),
        builder: (context, snapshot){
          if (snapshot.hasError) {
            return Text("Error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Load....");
          }
          return ListView(
            children: snapshot.data!.map((e) => Text(e["email"])).toList()
          );
        }
      ),
      bottomSheet: ChatBottomSheet(),
    );
  }
}

class ChatContact extends StatelessWidget {
  const ChatContact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15, right: 50, top: 20),
          child: ClipPath(
            clipper: UpperNipMessageClipper(MessageType.receive),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFFE1E1E2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(3, 3),
                  ),
                ]
              ),
              child: Text(
                "Hello!", style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10, top: 10),
          child: ClipPath(
            clipper: UpperNipMessageClipper(MessageType.send),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFFE1E1E2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(3, 3),
                  ),
                ]
              ),
              child: Text(
                "Hello!", style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}