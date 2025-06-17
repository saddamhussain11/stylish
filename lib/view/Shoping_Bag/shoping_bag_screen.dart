import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/res/constant/appcolors.dart';
import 'package:stylish/res/constant/appicons.dart';
import 'package:stylish/res/constant/appimages.dart';

class ShopingBagScreen extends StatefulWidget {
  const ShopingBagScreen({super.key});

  @override
  State<ShopingBagScreen> createState() => _ShopingBagScreenState();
}

class _ShopingBagScreenState extends State<ShopingBagScreen> {
  String? selectedSize;
  int? selectedQuantity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.weightColor,
      appBar: AppBar(
        backgroundColor: Appcolors.weightColor,
        toolbarHeight: 70.h,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Icon(Appicons.arrow_back, size: 20.sp),
        ),
        title: Text(
          'Shoping Bag',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Icon(Appicons.favorite),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              Card(
                margin: EdgeInsets.only(bottom: 15.h),
                elevation: 3.h,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 130.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Image.asset(
                                    Appimages.home2,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Women’s Casual Wear',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5.h),
                                      SizedBox(
                                        width: 180.w,
                                        child: Text(
                                          'Checked Single-Breasted Blazer',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5.h),
                                      Row(
                                        children: [
                                          // Size Dropdown
                                          Container(
                                            height: 30.h,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 8.w,
                                            ),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5.r),
                                            ),
                                            child: DropdownButton<String>(
                                              value: selectedSize,
                                              underline: SizedBox(),
                                              iconSize: 20.sp,
                                              items: ['S', 'M', 'L', 'XL'].map((
                                                String value,
                                              ) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(
                                                    value,
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (newValue) {
                                                setState(() {
                                                  selectedSize = newValue;
                                                });
                                              },
                                              hint: Text(
                                                "Size",
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10.w),

                                          // Quantity Dropdown
                                          Container(
                                            height: 30.h,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 8.w,
                                            ),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5.r),
                                            ),
                                            child: DropdownButton<int>(
                                              value: selectedQuantity,
                                              underline: SizedBox(),
                                              iconSize: 20.sp,
                                              items: List.generate(
                                                10,
                                                (index) => index + 1,
                                              ).map((int value) {
                                                return DropdownMenuItem<int>(
                                                  value: value,
                                                  child: Text(
                                                    value.toString(),
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (newValue) {
                                                setState(() {
                                                  selectedQuantity = newValue;
                                                });
                                              },
                                              hint: Text(
                                                "Qty",
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8.h),
                                      Row(
                                        children: [
                                          Text(
                                            "Diliver By",
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                          Text(
                                            "10 May 2XXX",
                                            style: TextStyle(
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 50.h),
                            //  Divider(height: 20.h, thickness: 1),
                            Row(
                              children: [
                                Icon(Appicons.coupen, size: 30.sp),
                                SizedBox(width: 5.w),
                                Text(
                                  "Apply Coupons",
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "Select",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Appcolors.pinkColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Divider(height: 20.h, thickness: 1),
                            SizedBox(height: 20.h),
                            Text(
                              "Order Payment Details",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Order Amount",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "\$7,000.00",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Convenience",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 14.w),
                                Text(
                                  "Know More",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Appcolors.pinkColor,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "Apply Coupons",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Appcolors.pinkColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Delivery Fee",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "Free",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Appcolors.pinkColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Divider(height: 20.h, thickness: 1),
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Order Total",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "\$7,000.00",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Emi Available",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  "Details",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Appcolors.pinkColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 40.h),
                          ],
                        ),
                      ),
                      Container(
                        height: 160.h,
                        width: double.infinity.w,
                        decoration: BoxDecoration(
                          color: Appcolors.greyColor,
                          borderRadius: BorderRadius.circular(15.r),
                          border: Border.all(
                            color: Appcolors.blackColor.withOpacity(0.1),
                            width: 1.r,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "\$7,000.00",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  "View Details",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Appcolors.pinkColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 20.w),
                            Container(
                              height: 50.h,
                              width: 180.w,
                              decoration: BoxDecoration(
                                color: Appcolors.pinkColor,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Center(
                                child: Text(
                                  "Proceed to Payment",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w800,
                                    color: Appcolors.weightColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
