import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  double? height;
  double? width;
  String? btnText;
  Color? btnColor;
  Color? btnTextColor;
  VoidCallback? onTap;
  CustomBtn({super.key, this.width = 100, this.height = 50, this.btnText = "Submit", this.btnColor = Colors.black,  this.btnTextColor = Colors.black, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, style: BorderStyle.solid),
          color: btnColor,
        ),
        child: Center(child: Text(btnText!,style: TextStyle(fontSize: 18, color: btnTextColor))),
      ),
    );
  }
}
