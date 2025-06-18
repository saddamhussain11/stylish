import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:http/http.dart' as http;

import 'package:stylish/res/constant/appcolors.dart';
import 'package:stylish/res/constant/appicons.dart';
import 'package:stylish/view_model/controller/backend/auth_controller.dart';
import 'package:stylish/res/utils/toast_utils.dart';
import 'package:stylish/view/auth/login_screen.dart';
import 'package:stylish/res/components/Button/Custom_Buton.dart';
import 'package:stylish/res/components/Fields/custom_textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignupScreen> {
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController paswordcontroler = TextEditingController();
  AuthController authController = Get.put(AuthController());
  final _formkey = GlobalKey<FormState>();
  // bool isloading = false;

  // void signup() async {
  //   try {
  //     setState(() {
  //       isloading = true;
  //     });

  //     final response = await http.post(
  //       Uri.parse('https://reqres.in/api/register'),
  //       body: {'email': emailcontroler.text, 'password': paswordcontroler.text},
  //       headers: {'x-api-key': 'reqres-free-v1'},
  //     );

  //     if (response.statusCode == 200) {
  //       Get.to(LoginScreen());
  //       SnackbarUtil.showSuccess('Creat acount succes');
  //       print(response.statusCode);
  //       print(response.body);
  //     } else {
  //       SnackbarUtil.showError('Creat Fail');
  //       print('faillllllll');
  //     }
  //   } catch (e) {
  //     SnackbarUtil.showError('Creat Fail');
  //   } finally {
  //     setState(() {
  //       isloading = false;
  //     });
  //   }
  // }

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
                      'Create an account',
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
                            width: 30.w,
                            color: Appcolors.greyColor,
                            labeltext: 'Enter your pasword',
                            inputType: TextInputType.visiblePassword,
                            showSuffixIcon: true,
                            iconData: Appicons.person,
                            validator: (value) {
                              if (value == '' || value == null) {
                                return 'Please enter your pasword';
                              }
                              return null;
                            },
                          ),
                          // CustomTextfield(
                          //   width: 320.w,
                          //   color: Appcolors.greyColor,
                          //   iconData: Appicons.lock,
                          //   border: true,
                          //   labeltext: 'Enter your confirm pasword',
                          //   inputType: TextInputType.visiblePassword,

                          //   showSuffixIcon: true,
                          //   validator: (value) {
                          //     if (value == '' || value == null) {
                          //       return 'Please enter your confirm Pasword';
                          //     } else if (value.length < 6) {
                          //       return 'Enter at least 6 digit';
                          //     }
                          //     return null;
                          //   },
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      children: [
                        SizedBox(
                          width: 270.w,
                          child: Text.rich(
                            TextSpan(
                              text: 'By clicking the ', // black part
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: Appcolors.blackColor,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Register',
                                  style: TextStyle(
                                    color: Appcolors
                                        .pinkColor, // 🔴 red color for 'Register'
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      ' button, you agree to the public offer', // black part again
                                ),
                              ],
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
                        title: 'Create Account',
                        ontap: () {
                          if (_formkey.currentState!.validate()) {
                            authController.signup(
                              emailcontroler.text,
                              paswordcontroler.text,
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 28.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'I Already Have an Account',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(LoginScreen());
                          },
                          child: Text(
                            'Login',
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
}
