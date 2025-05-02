import 'package:flutter/material.dart';

class CommonInput extends StatelessWidget {
  final String? hinText;
  final TextEditingController? controller;
  final Widget? suffix;
  final bool obscureText;
  final dynamic validator;
  const CommonInput(
      {super.key,
      this.hinText,
      this.controller,
      this.suffix,
      this.obscureText = false,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          filled: true,
          suffix: suffix,
          fillColor: Colors.grey.shade300,
          hintText: hinText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none)),
    );
  }
}
