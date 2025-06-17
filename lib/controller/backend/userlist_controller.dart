import 'dart:convert';

import 'package:get/get.dart';
import 'package:stylish/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:stylish/model/user_model2.dart';
import 'package:stylish/res/utils/toast_utils.dart';

class UserlistController extends GetxController {
  final RxBool isLoading = false.obs;
  RxList<Usermodel2> userlist = <Usermodel2>[].obs;

  Future getuser() async {
    try {
      isLoading.value = true;

      final response = await http.get(
        Uri.parse('https://reqres.in/api/users?page=2'),
      );

      final decode = jsonDecode(response.body);
      if (response.statusCode == 200) {
        final Usermodel2 user = Usermodel2.fromJson(decode);
        userlist.assignAll([user]);
      }
    } catch (e) {
      ToastUtils.showError('Data not found');
    } finally {
      isLoading.value = false;
    }
  }
}
