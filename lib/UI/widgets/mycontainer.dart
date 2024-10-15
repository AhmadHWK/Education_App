import 'package:flutter/material.dart';
import 'package:learning_system/Constant/colors.dart';

class MyContainer extends StatelessWidget {
  final String image;
  final String title;
  const MyContainer({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color1,
        border: Border.all(color: primaryColor),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Image.asset(
            height: 80,
            image,
          ),
          Text(
            title,
          ),
        ],
      ),
    );
  }
}
