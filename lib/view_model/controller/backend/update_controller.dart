import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:stylish/res/constant/api_endpoints.dart';
import 'package:stylish/model/product_model.dart';
import 'package:stylish/res/utils/toast_utils.dart';

class UpdateController extends GetxController {
  final RxBool isLoading = false.obs;

  Future<void> updatedata() async {
    try {
      isLoading.value = true;
      print('button is pressed');
      final response = await http.delete(
        Uri.parse('https://6838ac636561b8d882ade978.mockapi.io/social/todo/5'),

        // headers: {ApiEndpoints.apikey: ApiEndpoints.apikeyValue},
      );
      final decode = jsonDecode(response.body);
      final name = decode['name'];
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('user deleted successfull');
        ToastUtils.showSuccess('$name deleted successfull');
      } else {
        ToastUtils.showError(
          ' ${name}Failed to update: ${response.statusCode}',
        );
      }
    } catch (e) {
      ToastUtils.showError('no update');
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
