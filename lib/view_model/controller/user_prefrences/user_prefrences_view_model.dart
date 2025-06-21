import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stylish/model/login/user_response_model.dart';

class UserPrefrencesViewModel {
  Future<bool> saveUser(UserResponseModel usermodel) async {
    final storage = GetStorage();

    await storage.write('token', usermodel.token.toString());
    await storage.write('islogin', usermodel.islogin ?? false);
    if (kDebugMode) {
      print('✅ Token Saved: ${usermodel.token}');
      print('✅ islogin Saved: ${usermodel.islogin}');
    }
    return true;
  }

  Future<UserResponseModel> getUser() async {
    final storage = GetStorage();
    String? token = storage.read('token');
    bool? islogin = storage.read('islogin') ?? false;

    return UserResponseModel(token: token, islogin: islogin);
  }

  Future<bool> clearUser() async {
    final storage = GetStorage();
    await storage.write('islogin', false);
    await storage.remove('token');
    return true;
  }
}
