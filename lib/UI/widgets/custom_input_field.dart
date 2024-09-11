import 'package:flutter/material.dart';
import 'package:learning_system/Constant/colors.dart';

class CustomInputField extends StatefulWidget {
  final String hintText;
  final Icon icon;
  final bool suffixIcon;
  final bool prefixIcon;
  final bool obscureText;
  final bool validator;
  final TextEditingController? controller;

  const CustomInputField(
      {super.key,
      required this.hintText,
      this.suffixIcon = false,
      this.obscureText = false,
      this.controller,
      this.prefixIcon = false,
      required this.icon,
      this.validator = false});

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.end,
      obscureText: (widget.obscureText && _obscureText),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: primaryColor, width: 1.5)),
        hintText: widget.hintText,
        hintStyle: const TextStyle(fontSize: 15),
        suffixIconColor: primaryColor,
        suffixIcon: widget.suffixIcon ? widget.icon : null,
        prefixIconColor: primaryColor,
        prefixIcon: widget.prefixIcon
            ? IconButton(
                icon: Icon(
                  _obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.remove_red_eye,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (textValue) {
        if (textValue == null || textValue.isEmpty) {
          return 'الحقل فارغ';
        }
        return null;
      },
      controller: widget.controller,
    );
  }
}
