import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:stylish/constant/api_endpoints.dart';
import 'package:stylish/model/auth_models/login_model.dart';
import 'package:stylish/model/auth_models/signup_model.dart';
import 'package:stylish/utils/snackbar_utils.dart';
import 'package:stylish/view/Botom_Navigartion/botom_navigation_screen.dart';
import 'package:stylish/view/auth/login_screen.dart';

class AuthController extends GetxController {
  final RxBool isLoading = false.obs;

  Future login(String emailcontroller, String passwordController) async {
    print('Tap on Login Button');

    try {
      // hit the API endpoint for login
      isLoading.value = true;

      LoginModel loginModel = LoginModel(
        email: emailcontroller,
        password: passwordController,
      );
      final response = await http.post(
        Uri.parse('${ApiEndpoints.baseUrl}${ApiEndpoints.login}'),
        body: loginModel.toJson(),
        headers: {ApiEndpoints.apikey: ApiEndpoints.apikeyValue},
      );
      final decodedData = jsonDecode(response.body);

      print('api hit successfully');
      print(response.statusCode);

      if (response.statusCode == 200) {
        Get.to(BotomNavigationScreen());
        SnackbarUtil.showSuccess('Login Succes');
        print('Signup successful');
        print(response.body.toString());
      } else {
        print('Login failed');
      }
    } catch (e) {
      SnackbarUtil.showError('Login Fail');
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future signup(String email, String pasword) async {
    try {
      isLoading.value = true;
      signupModel signupmodel = signupModel(email: email, password: pasword);
      final response = await http.post(
        Uri.parse('${ApiEndpoints.baseUrl}${ApiEndpoints.register}'),
        body: signupmodel.toJson(),
        headers: {ApiEndpoints.apikey: ApiEndpoints.apikeyValue},
      );
      print('Api hit succesfuly');
      print(response.statusCode);
      if (response.statusCode == 200) {
        Get.to(LoginScreen());
        SnackbarUtil.showSuccess('Signup Succes');
      } else {
        SnackbarUtil.showError('Signup Fail');
      }
    } catch (e) {
      SnackbarUtil.showError('Signup Fail');
    } finally {
      isLoading.value = false;
    }
  }
}
