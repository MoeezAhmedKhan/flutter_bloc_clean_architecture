import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {

  FocusNode? focusNode;

  TextEditingController? controller;
  String hintText;
  void Function(String)? onChanged;
  TextInputType? keyboardType;


  bool obscureText;

  ValueChanged<String>? onFieldSubmitted;

  String? Function(String?)? validator;
  CustomTextfield({super.key, this.focusNode, this.controller, this.hintText = "", this.keyboardType, this.obscureText = false, this.onChanged, this.onFieldSubmitted, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      decoration: InputDecoration(hintText: hintText),
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
    );
  }
}
