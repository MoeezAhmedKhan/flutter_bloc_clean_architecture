import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean_architecture/services/splash/splash_servcies.dart';

import '../../data/exception/app_exception.dart';
class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  SplashServcies splashServcies = SplashServcies();
  @override
  Widget build(BuildContext context) {

    splashServcies.isLogin(context);

    return Scaffold(
        body: Center(
          child: TextButton(
            onPressed: (){
              // throw is used for throwing exception
              throw NoInternetException("Internet Exception: ");
              // Navigator.pushNamed(context, RoutesName.homehScreen);
            },
            child: const Text("Goto Home Screen"),
          ),
        )
    );
  }
}
