import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutCard extends StatelessWidget {
  final String image;
  final String title;
  final List<String> variations;
  final double rating;
  final double price;
  final double oldPrice;
  final String off;
  final int orderCount;

  const CheckoutCard({
    super.key,
    required this.image,
    required this.title,
    required this.variations,
    required this.rating,
    required this.price,
    required this.oldPrice,
    required this.off,
    required this.orderCount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 15.h),
      elevation: 3.h,
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Image.asset(image, fit: BoxFit.cover),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        children:
                            variations
                                .map(
                                  (color) => Container(
                                    margin: EdgeInsets.only(right: 5.w),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8.w,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.r),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: Text(
                                      color,
                                      style: TextStyle(fontSize: 12.sp),
                                    ),
                                  ),
                                )
                                .toList(),
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        children: [
                          Text(
                            rating.toString(),
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Row(
                            children: List.generate(
                              rating.floor(),
                              (index) => Icon(
                                Icons.star,
                                size: 14.sp,
                                color: Colors.amber,
                              ),
                            ),
                          ),
                          if (rating % 1 != 0)
                            Icon(
                              Icons.star_half,
                              size: 14.sp,
                              color: Colors.amber,
                            ),
                        ],
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        children: [
                          Text(
                            "₹${price.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Column(
                            children: [
                              Text(
                                "upto $off off",
                                style: TextStyle(
                                  color: Colors.pink,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "₹${oldPrice.toStringAsFixed(2)}",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(height: 20.h, thickness: 1),
            Row(
              children: [
                Text(
                  "Total Order",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 5.w),
                Text(
                  "($orderCount)",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  "₹${price.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
