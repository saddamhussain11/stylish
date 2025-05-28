// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:stylish/constant/api_endpoints.dart';

// class AddToCartController extends GetxController {
//   final RxBool isLoading = false.obs;

//   Future addToCartController(
//   String productName,
//   String productDes,
//   String productImage,
//   String productPrice,
//   ) async {
//     print('Tap on Login Button');

//     try {
//       // hit the API endpoint for login
//       isLoading.value = true;

//       AddToCartModel addToCartModel = AddToCartModel(
//         ;aj

//         sajll

//         sa
//       );
//       final response = await http.post(
//         Uri.parse('${ApiEndpoints.baseUrl}${ApiEndpoints.login}'),
//         body: addToCartModel.toJson(),
//         headers: {ApiEndpoints.apikey: ApiEndpoints.apikeyValue},
//       );
//       print('api hit successfully');
//       print(response.statusCode);

//       if (response.statusCode == 200) {
//         print('Signup successful');
//         print(response.body.toString());
//       } else {
//         print('Login failed');
//       }
//     } catch (e) {
//       print(e.toString());
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }
