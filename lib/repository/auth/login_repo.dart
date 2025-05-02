import 'package:flutter_bloc_clean_architecture/config/app_constant.dart';
import 'package:flutter_bloc_clean_architecture/data/network/network_service_api.dart';
import 'package:flutter_bloc_clean_architecture/model/user/user_model.dart';

class LoginRepo {
  final _api = NetworkServiceAPI();

  Future<UserModel> login(var data, var headers) async {
    var response = await _api.postApi("${AppConstant.baseUrl}login", data, headers: headers);
    print("response in repo: $response");
    return UserModel.fromJson(response);
  }
}
