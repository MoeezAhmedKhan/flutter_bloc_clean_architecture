import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar_route.dart';

class FlushHelper {
  static void showFlushBar({required String mesg, required BuildContext context, Color? backColor = Colors.black, Color? mesgColor = Colors.black, IconData? icon}) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          backgroundColor: backColor!,
          flushbarPosition: FlushbarPosition.TOP,
          flushbarStyle: FlushbarStyle.FLOATING,
          message: mesg,
          margin: const EdgeInsets.all(10.0),
          dismissDirection: FlushbarDismissDirection.HORIZONTAL,
          isDismissible: true,
          forwardAnimationCurve: Curves.bounceIn,
          duration: const Duration(seconds: 3),
          borderRadius: BorderRadius.circular(8.0),
          reverseAnimationCurve: Curves.bounceInOut,
          messageColor: mesgColor,
          icon: Icon(icon),
        )..show(context));
  }
}
