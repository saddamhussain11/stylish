import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:stylish/res/constant/appcolors.dart';
import 'package:stylish/res/constant/appicons.dart';
import 'package:stylish/res/utils/toast_utils.dart';
import 'package:stylish/view_model/controller/backend/auth_controller.dart';

import 'package:stylish/view/auth/forgat_screen.dart';
import 'package:stylish/view/auth/signup_screen.dart';
import 'package:stylish/res/components/Button/Custom_Buton.dart';
import 'package:stylish/res/components/Fields/custom_textfield.dart';
import 'package:stylish/view_model/controller/login/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController paswordcontroler = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  final AuthController authController = Get.put(AuthController());
  final loginVM = Get.put(LoginViewModel());
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 172.h),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome_back'.tr,
                      style: TextStyle(
                        fontSize: 36.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 21.h),
                    SizedBox(height: 15.h),
                    Form(
                      key: _formkey,
                      child: Column(
                        spacing: 26.h,
                        children: [
                          CustomTextfield(
                            controller: loginVM.emailcontroller.value,
                            focusNode: loginVM.emailFocusNode.value,
                            width: 30.w,
                            color: Appcolors.greyColor,
                            labeltext: 'email_hint'.tr,
                            inputType: TextInputType.text,
                            iconData: Appicons.person,
                            validator: (value) {
                              if (value == '' || value == null) {
                                return 'email_hint'.tr;
                              }
                              return null;
                            },
                            onFieldSubmitted: (value) {
                              ToastUtils.fieldfocusedchange(
                                  context,
                                  loginVM.emailFocusNode.value,
                                  loginVM.passwordFocusNode.value);
                            },
                          ),
                          CustomTextfield(
                            controller: loginVM.passwordcontroller.value,
                            focusNode: loginVM.passwordFocusNode.value,
                            width: 320.w,
                            color: Appcolors.greyColor,
                            iconData: Appicons.lock,
                            border: true,
                            labeltext: 'password_hint'.tr,
                            inputType: TextInputType.visiblePassword,
                            showSuffixIcon: true,
                            validator: (value) {
                              if (value == '' || value == null) {
                                return 'password_hint'.tr;
                              } else if (value.length < 6) {
                                return '6_digit_validation'.tr;
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(ForgatScreen());
                          },
                          child: Text(
                            textAlign: TextAlign.end,
                            'forgat_password'.tr,
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: Appcolors.pinkColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 45.h),
                    Obx(
                      () => Custombuton(
                        isLoading: loginVM.isLoading.value,
                        backgroundColor: Appcolors.pinkColor,
                        height: 55.h,
                        width: 320.w,
                        borderRadius: BorderRadius.circular(5.r),
                        title: 'Login',
                        ontap: () {
                          if (_formkey.currentState!.validate()) {
                            loginVM.loginapi();
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 28.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'create_an_account'.tr,
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(SignupScreen());
                          },
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: Appcolors.pinkColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroler.dispose();
    paswordcontroler.dispose();
  }
}
