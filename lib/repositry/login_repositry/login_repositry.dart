import 'package:stylish/data/network/network_api_services.dart';
import 'package:stylish/res/app_url/api_url.dart';

class LoginRepositry {
  final _apiservice = NetworkApiServices();

  Future<dynamic> loginApi(var data) async {
    dynamic response =
        await _apiservice.getPostApiResponse(ApiUrl.loginapi, data);
    return response;
  }
}
