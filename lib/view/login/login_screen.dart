import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean_architecture/model/user/user_model.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  UserModel userModel = UserModel();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Login")),
    );
  }
}
