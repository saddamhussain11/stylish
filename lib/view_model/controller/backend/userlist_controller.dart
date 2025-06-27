import 'dart:convert';

import 'package:get/get.dart';
import 'package:stylish/data/response/status.dart';
import 'package:stylish/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:stylish/model/user_model2.dart';
import 'package:stylish/repositry/user_list/user_list_repositry.dart';
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

  final api = UserListRepositry();
  final status = Status.LODING.obs;
  final Rx<Usermodel2> userslist = Usermodel2().obs;

  void setstatus(Status value) => status.value = value;
  void setuserlist(Usermodel2 value) {
    userslist.value = value;
  }

  void getuserlist() {
    api.userlistrepo().then(
      (value) {
        setstatus(Status.COMPLETED);
        setuserlist(value);
      },
    ).onError(
      (error, stackTrace) {
        setstatus(Status.ERROR);
      },
    );
  }
}
