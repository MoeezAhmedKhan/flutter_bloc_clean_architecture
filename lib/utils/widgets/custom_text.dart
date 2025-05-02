import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  String? text;
  Color? color;
  double? fontSize;
  FontWeight? fontWeight;
  MyText({super.key, this.text = "",  this.color = Colors.black, this.fontSize = 18.0, this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(text!, style: TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),);
  }
}
