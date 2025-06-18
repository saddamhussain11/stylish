import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stylish/res/components/Button/Custom_Buton.dart';
import 'package:stylish/res/constant/appcolors.dart';

class InternetExcaptionWidget extends StatelessWidget {
  final VoidCallback ontap;
  const InternetExcaptionWidget({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 35.h,
          ),
          Icon(
            Icons.cloud_off,
            color: Appcolors.pinkColor,
            size: 50.sp,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'internet_excaption'.tr,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 100.h,
          ),
          Custombuton(
            height: 40.h,
            width: 110.w,
            borderRadius: BorderRadius.circular(20.r),
            backgroundColor: Appcolors.pinkColor,
            ontap: ontap,
            title: 'Retry',
          )
        ],
      ),
    );
  }
}
