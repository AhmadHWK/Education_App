import 'package:flutter/material.dart';

import '../../Constant/colors.dart';

class SearchTextFeild extends StatelessWidget {
  const SearchTextFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: TextFormField(
      textAlign: TextAlign.end,
      decoration: InputDecoration(
          suffixIcon: const Icon(
            Icons.search,
            size: 30,
          ),
          fillColor: color1,
          filled: true,
          hintText: '...بحث',
          isDense: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none)),
    ));
  }
}
