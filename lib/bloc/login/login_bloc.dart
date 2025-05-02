import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_clean_architecture/bloc/login/login_event.dart';
import 'package:flutter_bloc_clean_architecture/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  LoginBloc() : super(LoginState()){
    on<LoginEvent>(_login);
  }

  _login(LoginEvent event, Emitter<LoginState> emit){
    final updatedData = Map<String, String>.from(state.formData ?? {})..[event.fieldName] = event.value;
    emit(state.copyWith(formData: updatedData));
  }
}