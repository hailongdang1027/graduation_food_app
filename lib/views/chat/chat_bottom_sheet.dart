import 'package:flutter/material.dart';
import 'package:order_food/common/color.dart';

class ChatBottomSheet extends StatelessWidget {
  const ChatBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(color: ExtensionColor.white, boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 3))
      ]),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: Icon(
              Icons.emoji_emotions_outlined,
              size: 20,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Container(
              alignment: Alignment.centerRight,
              width: 270,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Write something",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.send,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
