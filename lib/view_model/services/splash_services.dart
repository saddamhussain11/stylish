import 'dart:async';

import 'package:get/get.dart';
import 'package:stylish/res/routes/routes_names.dart';

class SplashServices {
  void islogin() {
    Timer(Duration(seconds: 3), () => Get.offAllNamed(RoutesNames.loginScreen));
  }
}
