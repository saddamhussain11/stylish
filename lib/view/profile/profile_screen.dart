import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/constant/appcolors.dart';
import 'package:stylish/constant/appicons.dart';
import 'package:stylish/constant/appimages.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.h,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Icon(Appicons.arrow_back, size: 20.sp),
        ),
        title: Text(
          'Checkout',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20.h),
          Center(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 60.r,
                  backgroundColor: Appcolors.weightColor,
                ),
                Positioned(
                  left: 8.w,
                  child: CircleAvatar(
                    radius: 50.r,
                    backgroundImage: AssetImage(Appimages.profile),
                  ),
                ),
                Positioned(
                  top: 60.h,
                  left: 80.w,
                  child: CircleAvatar(
                    radius: 15.r,
                    backgroundColor: Appcolors.litebluColor,
                    child: IconButton(
                      icon: Icon(
                        Appicons.edit,
                        size: 13.sp,
                        color: Appcolors.weightColor,
                      ),
                      onPressed: () {
                        // Add your edit profile logic here
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            'Name',
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
