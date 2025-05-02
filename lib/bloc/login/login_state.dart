import 'package:flutter_bloc_clean_architecture/utils/enums/enum.dart';

class LoginState {
  final Map<String, String>? formData;
  final PostApiStatus? postApiStatus;
  final String? mesg;
  LoginState({this.formData = const {}, this.postApiStatus = PostApiStatus.initial, this.mesg = ''});

  LoginState copyWith({Map<String, String>? formData, PostApiStatus? postApiStatus, String? mesg}) {
    return LoginState(formData: formData ?? this.formData, postApiStatus: postApiStatus ?? this.postApiStatus, mesg: mesg ?? this.mesg);
  }
}
