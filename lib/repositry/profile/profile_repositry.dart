import 'package:stylish/data/network/network_api_services.dart';
import 'package:stylish/model/my_profile_model.dart';
import 'package:stylish/res/app_url/api_url.dart';

class ProfileRepositry {
  final _apiService = NetworkApiServices();
  final String apiurl = ApiUrl.profileapi;

  Future<MyProfileModel> getprofiledata() async {
    final response = await _apiService.getGetApiResponse(apiurl);
    return MyProfileModel.fromJson(response);
  }
}
