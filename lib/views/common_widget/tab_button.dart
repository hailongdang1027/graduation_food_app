import 'package:flutter/material.dart';
import 'package:order_food/common/color.dart';

class TabButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String icon;
  final bool isChoosed;
  const TabButton({super.key, required this.onTap, required this.title, required this.icon, required this.isChoosed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            width: 10,
            height: 10,
            color: isChoosed ? ExtensionColor.primary : ExtensionColor.placeholder,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: TextStyle(
                color: isChoosed ? ExtensionColor.primary : ExtensionColor.placeholder, 
                fontSize: 10, 
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
