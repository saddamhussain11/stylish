import 'package:stylish/data/network/network_api_services.dart';
import 'package:stylish/model/user_model2.dart';
import 'package:stylish/res/app_url/api_url.dart';

class UserListRepositry {
  final api = NetworkApiServices();

  Future<Usermodel2> userlistrepo() async {
    final response = await api.getGetApiResponse(ApiUrl.userlistapi);

    return Usermodel2.fromJson(response);
  }
}
