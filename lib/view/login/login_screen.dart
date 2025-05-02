import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_architecture/bloc/login/login_bloc.dart';
import 'package:flutter_bloc_clean_architecture/bloc/login/login_event.dart';
import 'package:flutter_bloc_clean_architecture/bloc/login/login_state.dart';
import 'package:flutter_bloc_clean_architecture/model/user/user_model.dart';
import 'package:flutter_bloc_clean_architecture/utils/enums/enum.dart';
import 'package:flutter_bloc_clean_architecture/utils/flushbar_helper.dart';
import 'package:flutter_bloc_clean_architecture/utils/validations/string_validations.dart';
import 'package:flutter_bloc_clean_architecture/utils/widgets/custom_btn.dart';
import 'package:flutter_bloc_clean_architecture/utils/widgets/custom_text.dart';

import '../../utils/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserModel userModel = UserModel();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  late LoginBloc _loginBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    log("Build!!!");
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => _loginBloc,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Form(
              key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(text: "Login"),
                  const SizedBox(height: 30),
                  BlocBuilder<LoginBloc, LoginState>(
                    buildWhen: (previous, current) => previous.formData == current.formData,
                    builder: (context, state) {
                      return CustomTextfield(
                        focusNode: emailFocusNode,
                        controller: emailController,
                        hintText: "Enter email",
                        onChanged: (value) {
                          context.read<LoginBloc>().add(FormFieldChangedEvent(fieldName: "email", value: value));
                        },
                        onFieldSubmitted: (value) {
                          focuShift(passwordFocusNode);
                        },
                        validator: (p0) => StringValidations.emailString(emailController.text.toString()),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<LoginBloc, LoginState>(
                    buildWhen: (previous, current) => previous.formData == current.formData,
                    builder: (context, state) {
                      return CustomTextfield(
                        focusNode: passwordFocusNode,
                        controller: passwordController,
                        hintText: "Enter password",
                        onChanged: (value) {
                          context.read<LoginBloc>().add(FormFieldChangedEvent(fieldName: "password", value: value));
                        },
                        onFieldSubmitted: (value) {},
                        validator: (p0) => StringValidations.emptyString(passwordController.text.toString()),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  BlocListener<LoginBloc, LoginState>(
                    listenWhen: (previous, current) => previous.postApiStatus != current.postApiStatus,
                    listener: (context, state) {
                      if(state.postApiStatus == PostApiStatus.success){
                        FlushHelper.showFlushBar(mesg: state.mesg.toString(), context: context, icon: Icons.check, mesgColor: Colors.white);
                      }
                      if(state.postApiStatus == PostApiStatus.error){
                        FlushHelper.showFlushBar(mesg: state.mesg.toString(), context: context, icon: Icons.clear, mesgColor: Colors.white);
                      }
                    },
                    child: BlocBuilder<LoginBloc, LoginState>(
                      buildWhen: (previous, current) => previous.postApiStatus != current.postApiStatus,
                      builder: (context, state) {
                        return CustomBtn(
                          btnTextColor: Colors.white,
                          width: 190,
                          onTap: () => onLogin(context),
                          isShowCircularProgress: state.postApiStatus == PostApiStatus.loading,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  onLogin(BuildContext context) {
    if (_key.currentState!.validate()) {
      context.read<LoginBloc>().add(OnLoginEvent());
    }
  }

  void focuShift(FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }
}
