import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean_architecture/utils/data/exception/app_exception.dart';

import '../../utils/routes/routes_name.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
