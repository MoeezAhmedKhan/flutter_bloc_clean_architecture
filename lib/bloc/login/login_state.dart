class LoginState {
  final Map<String, String>? formData;
  LoginState({this.formData = const {}});


  LoginState copyWith({Map<String, String>? formData}){
    return LoginState(formData: formData ?? this.formData);
  }
}
