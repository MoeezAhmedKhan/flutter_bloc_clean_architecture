import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean_architecture/utils/routes/routes_name.dart';
import 'package:flutter_bloc_clean_architecture/view/home/home_screen.dart';
import 'package:flutter_bloc_clean_architecture/view/login/login_screen.dart';
import 'package:flutter_bloc_clean_architecture/view/splash/splash_screen.dart';
class Routes {
  static Route<dynamic> generateRoutes(RouteSettings setting) {
    switch (setting.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RoutesName.homehScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(child: Text("No Route Found")),
          );
        },);
    }
  }
}