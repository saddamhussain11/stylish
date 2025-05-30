import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stylish/constant/appcolors.dart';
import 'package:stylish/constant/appicons.dart';
import 'package:stylish/controller/backend/my_profile_controller.dart';
import 'package:stylish/controller/backend/update_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UpdateController updateController = Get.put(UpdateController());
  final MyProfileController myProfileController = Get.put(
    MyProfileController(),
  );

  @override
  void initState() {
    super.initState();
    myProfileController.fetchUserProfile();
  }

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
          'Profile',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (myProfileController.isLoading.value) {
          return const Center(child: CupertinoActivityIndicator(radius: 30));
        } else if (myProfileController.listData == null) {
          return Center(
            child: ElevatedButton(
              onPressed: () => myProfileController.fetchUserProfile(),
              child: const Text('Fetch Profile'),
            ),
          );
        } else {
          final profile = myProfileController.listData.first;

          return Column(
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
                        backgroundImage: NetworkImage(
                          profile?.data?.avatar ?? '',
                        ),
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
                            updateController.updatedata();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                '${profile?.data?.firstName ?? 'First'} ${profile?.data?.lastName ?? 'Last'}',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.h),
              Text(
                profile?.data?.email ?? 'Email not available',
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ),
            ],
          );
        }
      }),
    );
  }
}
