class productModel {
  String? status;
  List<Result>? result;

  productModel({this.status, this.result});

  productModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  int? id;
  String? image;
  String? size;
  String? name;
  String? title;
  int? ratedpeople;
  int? oldprice;
  int? newprice;
  String? productdetail;
  String? productcategory;

  Result({
    this.id,
    this.image,
    this.size,
    this.name,
    this.title,
    this.ratedpeople,
    this.oldprice,
    this.newprice,
    this.productdetail,
    this.productcategory,
  });

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    size = json['size'];
    name = json['name'];
    title = json['title'];
    ratedpeople = json['ratedpeople'];
    oldprice = json['oldprice'];
    newprice = json['newprice'];
    productdetail = json['productdetail'];
    productcategory = json['productcategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['size'] = this.size;
    data['name'] = this.name;
    data['title'] = this.title;
    data['ratedpeople'] = this.ratedpeople;
    data['oldprice'] = this.oldprice;
    data['newprice'] = this.newprice;
    data['productdetail'] = this.productdetail;
    data['productcategory'] = this.productcategory;
    return data;
  }
}
