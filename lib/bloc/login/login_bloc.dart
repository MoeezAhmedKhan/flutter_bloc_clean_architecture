import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_clean_architecture/bloc/login/login_event.dart';
import 'package:flutter_bloc_clean_architecture/bloc/login/login_state.dart';
import 'package:flutter_bloc_clean_architecture/repository/auth/login_repo.dart';
import 'package:flutter_bloc_clean_architecture/utils/enums/enum.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepo _repo = LoginRepo();
  LoginBloc() : super(LoginState()) {
    on<FormFieldChangedEvent>(_formFieldChange);
    on<OnLoginEvent>(_login);
  }

  _formFieldChange(FormFieldChangedEvent event, Emitter<LoginState> emit) {
    final updatedData = Map<String, String>.from(state.formData ?? {})..[event.fieldName] = event.value;
    emit(state.copyWith(formData: updatedData));
  }

  void _login(OnLoginEvent event, Emitter<LoginState> emit) async {
    log("state formData: ${state.formData} || state mesg: ${state.mesg ?? ''} || state postApiStatus: ${state.postApiStatus}");
    emit(state.copyWith(postApiStatus: PostApiStatus.loading));
    await _repo.login(state.formData, {'x-api-key': 'reqres-free-v1'}).then(
      (value) {
        if (value.error!.isNotEmpty) {
          emit(state.copyWith(mesg: value.error.toString(), postApiStatus: PostApiStatus.error));
        } else {
          emit(state.copyWith(mesg: value.error.toString(), postApiStatus: PostApiStatus.success));
        }
      },
    ).onError(
      (error, stackTrace) {
        emit(state.copyWith(mesg: error.toString(), postApiStatus: PostApiStatus.error));
      },
    );
  }
}
