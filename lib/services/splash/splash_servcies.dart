import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean_architecture/utils/routes/routes_name.dart';

class SplashServcies{
  void isLogin(BuildContext context){
    Future.delayed(const Duration(seconds: 3), () => Navigator.pushReplacementNamed(context, RoutesName.loginScreen));
  }
}