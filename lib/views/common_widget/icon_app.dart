import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconApp extends StatelessWidget {
  final IconData iconData;
  final Color bgColor;
  final Color iconColor;
  final double sizeOfContainer;
  IconApp({super.key, required this.iconData, this.bgColor = const Color(0xFFfcf4e4), this.iconColor = const Color(0xFF756d54), this.sizeOfContainer = 40 });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizeOfContainer,
      height: sizeOfContainer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: bgColor
      ),
      child: InkWell(
        onTap: (){
          Navigator.pop(context);
        },
        child: Icon(
          iconData,
          color: iconColor,
          size: 16, 
        ),
      ),
    );
  }
}