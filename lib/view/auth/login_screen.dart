import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:stylish/constant/appcolors.dart';
import 'package:stylish/constant/appicons.dart';
import 'package:stylish/controller/backend/auth_controller.dart';

import 'package:stylish/view/auth/forgat_screen.dart';
import 'package:stylish/view/auth/signup_screen.dart';
import 'package:stylish/widget/Button/Custom_Buton.dart';
import 'package:stylish/widget/Fields/custom_textfield.dart';

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
                      'Welcome back',
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
                            controller: emailcontroler,
                            width: 30.w,
                            color: Appcolors.greyColor,
                            labeltext: 'Enter your Ful Email',
                            inputType: TextInputType.text,
                            iconData: Appicons.person,
                            validator: (value) {
                              if (value == '' || value == null) {
                                return 'Please enter your Email';
                              }
                              return null;
                            },
                          ),
                          CustomTextfield(
                            controller: paswordcontroler,
                            width: 320.w,
                            color: Appcolors.greyColor,
                            iconData: Appicons.lock,
                            border: true,
                            labeltext: 'Enter your pasword',
                            inputType: TextInputType.visiblePassword,
                            showSuffixIcon: true,
                            validator: (value) {
                              if (value == '' || value == null) {
                                return 'Please enter your Pasword';
                              } else if (value.length < 6) {
                                return 'Enter at least 6 digit';
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
                            'Forgot Password ?',
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
                        isLoading: authController.isLoading.value,
                        backgroundColor: Appcolors.pinkColor,
                        height: 55.h,
                        width: 320.w,
                        borderRadius: BorderRadius.circular(5.r),
                        title: 'Login',
                        ontap: () {
                          if (_formkey.currentState!.validate()) {
                            authController.login(
                              emailcontroler.text,
                              paswordcontroler.text,
                            );
                          }
                        },
                      ),
                    ),
                    Custombuton(
                      isLoading: authController.isLoading.value,
                      backgroundColor: Appcolors.pinkColor,
                      height: 55.h,
                      width: 320.w,
                      borderRadius: BorderRadius.circular(5.r),
                      title: 'Login',
                      ontap: () {
                        if (_formkey.currentState!.validate()) {
                          authController.login(
                            emailcontroler.text,
                            paswordcontroler.text,
                          );
                        }
                      },
                    ),
                    SizedBox(height: 28.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Creat an account ?',
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
