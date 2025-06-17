import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:stylish/res/constant/appcolors.dart';
import 'package:stylish/res/constant/appicons.dart';
import 'package:stylish/widget/Button/Custom_Buton.dart';
import 'package:stylish/widget/Fields/custom_textfield.dart';

class ForgatScreen extends StatefulWidget {
  const ForgatScreen({super.key});

  @override
  State<ForgatScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<ForgatScreen> {
  TextEditingController emailcontroler = TextEditingController();

  final _formkey = GlobalKey<FormState>();

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
                      'Forgat Screen',
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
                        ],
                      ),
                    ),
                    SizedBox(height: 45.h),
                    Custombuton(
                      backgroundColor: Appcolors.pinkColor,
                      height: 55.h,
                      width: 320.w,
                      borderRadius: BorderRadius.circular(5.r),
                      title: 'Send',
                      ontap: () {},
                    ),
                    SizedBox(height: 28.h),
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
