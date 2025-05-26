import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/constant/appcolors.dart';
import 'package:stylish/constant/appimages.dart';
import 'package:stylish/widget/Button/Custom_Buton.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            Appimages.Onboarding,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 38.h),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 270.w,
                    child: Text(
                      'You want Authentic, here you go!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 2.w,
                        fontSize: 34.sp,
                        fontWeight: FontWeight.w600,
                        color: Appcolors.weightColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Find it here, buy it now!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Appcolors.greyColor,
                    ),
                  ),
                  SizedBox(height: 35.h),
                  Custombuton(
                    ontap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    title: 'Get Started',
                    backgroundColor: Appcolors.pinkColor,
                    height: 50.h,
                    width: 200.w,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
