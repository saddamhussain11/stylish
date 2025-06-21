import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:stylish/res/routes/routes_names.dart';
import 'package:stylish/view_model/controller/user_prefrences/user_prefrences_view_model.dart';

class SplashServices {
  UserPrefrencesViewModel user = UserPrefrencesViewModel();
  void islogin() {
    user.getUser().then(
      (value) {
        if (kDebugMode) {
          print('Token from storage: ${value.token}');
        }
        if (value.islogin == false || value.islogin.toString() == 'null') {
          Timer(Duration(seconds: 3),
              () => Get.offAllNamed(RoutesNames.loginScreen));
        } else {
          Timer(Duration(seconds: 3),
              () => Get.offAllNamed(RoutesNames.botomnavscreen));
        }
      },
    );
  }
}
