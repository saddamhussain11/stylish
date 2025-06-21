class UserResponseModel {
  String? token;
  bool? islogin;

  UserResponseModel({this.token, this.islogin});

  UserResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    islogin = json['islogin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['islogin'] = this.islogin;
    return data;
  }
}
