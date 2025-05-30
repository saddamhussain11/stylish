
class Usermodel {
  String? createdAt;
  String? name;
  String? avatar;
  String? id;

  Usermodel({this.createdAt, this.name, this.avatar, this.id});

  Usermodel.fromJson(Map<String, dynamic> json) {
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["avatar"] is String) {
      avatar = json["avatar"];
    }
    if(json["id"] is String) {
      id = json["id"];
    }
  }

  static List<Usermodel> fromList(List<Map<String, dynamic>> list) {
    return list.map(Usermodel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["createdAt"] = createdAt;
    _data["name"] = name;
    _data["avatar"] = avatar;
    _data["id"] = id;
    return _data;
  }
}