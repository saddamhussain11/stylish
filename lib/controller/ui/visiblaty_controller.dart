import 'package:get/get.dart';

class VisiblatyController extends GetxController {
  RxBool isvisible = true.obs;

  void toggleVisibility() {
    isvisible.value = !isvisible.value;
  }
}
