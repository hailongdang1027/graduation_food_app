import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomStepper extends StatefulWidget {
  final int lower;
  final int upper;
  final int stepVal;
  final double iconSize;
  int value;
  ValueChanged<dynamic> onChanged;
  CustomStepper(
      {required this.lower,
      required this.upper,
      required this.stepVal,
      required this.iconSize,
      required this.value,
      required this.onChanged,
      super.key});

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 80,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent, width: 1),
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                widget.value = widget.value == widget.lower
                    ? widget.lower
                    : widget.value -= widget.stepVal;
                widget.onChanged({"quantity": widget.value, "handle": "-"});
              });
            },
            child: const Icon(Icons.remove, color: Colors.black, size: 20,),
          ),
          SizedBox(
            width: widget.iconSize,
            child: Text(
              widget.value.toString(),
              style: TextStyle(
                fontSize: widget.iconSize * 0.7,
                color: Colors.black
              ),
              textAlign: TextAlign.center,
            ),
          ),    
          GestureDetector(
            onTap: () {
              setState(() {
                widget.value = widget.value == widget.upper
                    ? widget.upper
                    : widget.value += widget.stepVal;
                widget.onChanged({"quantity": widget.value, "handle": "+"});
              });
            },
            child: const Icon(Icons.add, color: Colors.black, size: 20,),
          ),
        ],
      ),
    );
  }
}
