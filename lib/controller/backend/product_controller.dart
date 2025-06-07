import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:stylish/constant/api_endpoints.dart';
import 'package:stylish/model/product_model.dart';
import 'package:stylish/utils/snackbar_utils.dart';

class ProductController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxList<ProductModel> productlist = <ProductModel>[].obs;
  RxString image = ''.obs;

  // Future fetchUserProfile() async {
  //   print('Tap on Login Button');

  //   try {
  //     isLoading.value = true;

  //     final response = await http.get(
  //       Uri.parse('${ApiEndpoints.baseUrl}${ApiEndpoints.profile}'),
  //       headers: {ApiEndpoints.apikey: ApiEndpoints.apikeyValue},
  //     );
  //     print('API hit successfully');
  //     print('Status Code: ${response.statusCode}');

  //     if (response.statusCode == 200) {
  //       final decodedData = jsonDecode(response.body);

  //       /// agar decodedData ek list ho
  //       if (decodedData is List) {
  //         listData.assignAll(
  //           decodedData.map((e) => MyProfileModel.fromJson(e)).toList(),
  //         );
  //       }

  //       print('Signup successful');
  //       print(response.body.toString());
  //     } else {
  //       print('Login failed');
  //     }
  //   } catch (e) {
  //     print('Error: ${e.toString()}');
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  Future<void> getproduct() async {
    try {
      isLoading.value = true;

      final response = await http.get(
        Uri.parse('https://fakestoreapi.com/products'),
      );

      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        // ✅ Assign List<Result> directly

        final skippedData = (decodedData as List).skip(1).toList();
        print("Skipped Data: ${skippedData.length} items");
        productlist.assignAll(
          skippedData.map((e) => ProductModel.fromJson(e)).toList(),
        );

        print(decodedData);
      } else {
        SnackbarUtil.showError(
          'Failed to load products: ${response.statusCode}',
        );
      }
    } catch (e) {
      SnackbarUtil.showError('Product Not Found');
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
