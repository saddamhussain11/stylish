import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish/res/constant/appcolors.dart';
import 'package:stylish/res/constant/appicons.dart';

class ToastUtils {
  static void fieldfocusedchange(
      BuildContext context, FocusNode current, FocusNode nextfocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextfocus);
  }

  static void showSuccess(String message, {String title = "Success"}) {
    _showSnackbar(title, message, Appcolors.litegreenColor, Appicons.succes);
  }

  static void showError(String message, {String title = "Error"}) {
    _showSnackbar(title, message, Appcolors.pinkColor, Appicons.error);
  }

  static void showWarning(String message, {String title = "Warning"}) {
    _showSnackbar(title, message, Appcolors.orange, Appicons.warning);
  }

  static void _showSnackbar(
    String title,
    String message,
    Color color,
    IconData icon,
  ) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: color.withValues(alpha: .9),
      colorText: Appcolors.weightColor,
      icon: Icon(icon, color: Appcolors.weightColor),
      margin: const EdgeInsets.all(10),
      borderRadius: 10,
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 500),
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}
