import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:stylish/data/response/status.dart';
import 'package:stylish/repositry/profile/profile_repositry.dart';
import 'package:stylish/res/app_url/api_url.dart';
import 'package:stylish/model/my_profile_model.dart';

class MyProfileController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxList<MyProfileModel> listData = <MyProfileModel>[].obs;

  Future fetchUserProfile() async {
    print('Tap on Login Button');

    try {
      isLoading.value = true;

      final response = await http.get(
        Uri.parse(ApiUrl.profileapi),
        headers: {ApiUrl.apikey: ApiUrl.apikeyValue},
      );
      print('API hit successfully');
      print('Status Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        final MyProfileModel user = MyProfileModel.fromJson(decodedData);
        print('decoded data..............${decodedData['data']}');
        listData.add(user);
        print('Data..................: ${listData}');
        // print("User Email: ${listData.value?.data?.email}");
      } else {
        print('API failed');
      }
    } catch (e) {
      print('Error: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }

  final profilerepo = ProfileRepositry();

  final status = Status.LODING.obs;
  final Rx<MyProfileModel> profilelist = MyProfileModel().obs;
  final RxString error = ''.obs;
  void setstatus(Status value) {
    status.value = value;
  }

  void setprofilelist(MyProfileModel value) {
    profilelist.value = value;
  }

  void seteror(String value) {
    error.value = value;
  }

  void getprofile() {
    profilerepo.getprofiledata().then(
      (value) {
        setstatus(Status.COMPLETED);
        setprofilelist(value);
      },
    ).onError(
      (error, stackTrace) {
        seteror(error.toString());
        setstatus(Status.ERROR);
      },
    );
  }

  void refreshprofile() {
    setstatus(Status.LODING);
    profilerepo.getprofiledata().then(
      (value) {
        setstatus(Status.COMPLETED);
        setprofilelist(value);
      },
    ).onError(
      (error, stackTrace) {
        seteror(error.toString());
        setstatus(Status.ERROR);
      },
    );
  }
}
