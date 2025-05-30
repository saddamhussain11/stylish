import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:stylish/constant/api_endpoints.dart';
import 'package:stylish/model/my_profile_model.dart';

class MyProfileController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxList<MyProfileModel> listData = <MyProfileModel>[].obs;

  Future fetchUserProfile() async {
    print('Tap on Login Button');

    try {
      isLoading.value = true;

      final response = await http.get(
        Uri.parse('${ApiEndpoints.baseUrl}${ApiEndpoints.profile}'),
        headers: {ApiEndpoints.apikey: ApiEndpoints.apikeyValue},
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
}
