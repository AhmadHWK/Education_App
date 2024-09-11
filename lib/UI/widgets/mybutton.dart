import 'package:flutter/material.dart';
import 'package:learning_system/Constant/colors.dart';

class MyButton extends StatelessWidget {
  final String theimage;
  final dynamic isclick;
  const MyButton({super.key, required this.theimage, required this.isclick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => isclick,
      child: Container(
        height: 80,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: color2, borderRadius: BorderRadius.circular(40)),
        child: Image.asset(
          theimage,
          color: Colors.black,
        ),
      ),
    );
  }
}
