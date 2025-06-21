import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:stylish/model/login/user_response_model.dart';
import 'package:stylish/repositry/login_repositry/login_repositry.dart';
import 'package:stylish/res/routes/routes_names.dart';
import 'package:stylish/res/utils/toast_utils.dart';
import 'package:stylish/view_model/controller/user_prefrences/user_prefrences_view_model.dart';

class LoginViewModel extends GetxController {
  final _userprefrence = UserPrefrencesViewModel();
  final _api = LoginRepositry();
  final emailcontroller = TextEditingController().obs;
  final passwordcontroller = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  RxBool isLoading = false.obs;
  void loginapi() {
    Map<String, dynamic> data = {
      'email': emailcontroller.value.text,
      'password': passwordcontroller.value.text,
    };
    isLoading.value = true;
    _api.loginApi(data).then(
      (value) {
        UserResponseModel userResponseModel =
            UserResponseModel(token: value['token'], islogin: true);
        _userprefrence.saveUser(userResponseModel).then(
          (value) {
            ToastUtils.showSuccess('Login Successfully');
            isLoading.value = false;
            Get.offAllNamed(RoutesNames.homescreen);
          },
        );
      },
    ).onError(
      (error, stackTrace) {
        ToastUtils.showError('Login Failed: ${error.toString()}');
        if (kDebugMode) {
          print(error.toString());
        }
        isLoading.value = false;
      },
    );
  }
}
