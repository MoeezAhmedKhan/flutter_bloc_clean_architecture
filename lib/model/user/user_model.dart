class UserModel {
  String? token;
  String? error;

  // Constructor
  UserModel({this.token, this.error});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json['token'] as String?,
      error: json['error'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'error': error,
    };
  }

  // CopyWith method
  UserModel copyWith({String? token, String? error}) {
    return UserModel(
      token: token ?? this.token,
      error: error ?? this.error,
    );
  }
}
