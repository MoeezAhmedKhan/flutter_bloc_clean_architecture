import 'package:flutter/material.dart';

import '../../utils/routes/routes_name.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () => Navigator.pushNamed(context, RoutesName.homehScreen),
            child: const Text("Goto Home Screen"),
          ),
        )
    );
  }
}
