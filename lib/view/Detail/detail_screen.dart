import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stylish/constant/appcolors.dart';
import 'package:stylish/constant/appicons.dart';
import 'package:stylish/constant/appimages.dart';
import 'package:stylish/controller/backend/add_to_cart_controller.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final List<String> sizes = ['6 UK', '7 UK', '8 UK', '9 UK', '10 UK'];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.h,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Icon(Appicons.arrow_back, size: 20.sp),
        ),

        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Icon(
              Appicons.cart_shopping_outlined,
              size: 20.sp,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 220.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: DecorationImage(
                  image: AssetImage(Appimages.favorite2),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 25.h),
            Text(
              'Size: 7UK',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(sizes.length, (index) {
                bool isSelected = index == selectedIndex;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 6.w),
                    padding: EdgeInsets.symmetric(
                      horizontal: 13.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color:
                          isSelected ? Appcolors.pinkColor : Colors.transparent,
                      border: Border.all(color: Appcolors.pinkColor),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      sizes[index],
                      style: TextStyle(
                        color:
                            isSelected
                                ? Appcolors.weightColor
                                : Appcolors.pinkColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 20.h),
            Text(
              'NIke Sneakers',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 10.h),
            Text(
              'Vision Alta Men’s Shoes Size (All Colours)',
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                ...List.generate(
                  4.floor(),
                  (index) =>
                      Icon(Icons.star, color: Appcolors.amber, size: 16.sp),
                ),
                if (4 % 1 != 0)
                  Icon(Icons.star_half, color: Appcolors.amber, size: 16.sp),
                SizedBox(width: 4),
                Text(
                  '56,890',
                  style: TextStyle(
                    color: Appcolors.blackColor.withOpacity(0.4),
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '₹${2999}',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      '₹${1500}',
                      style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      '50% Off',
                      style: TextStyle(
                        color: Appcolors.pinkColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Text(
              'Product Details',
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 5.h),
            SizedBox(
              width: 470.w,
              child: Text(
                textAlign: TextAlign.start,
                'Product DetailsPerhaps the most iconic sneaker of all-time, this original "Chicago"? colorway is the cornerstone to any sneaker collection. Made famous in 1985 by Michael Jordan, the shoe has stood the test of time, becoming the most famous colorway of the Air Jordan 1. This 2015 release saw the ...More',
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildcontainer(
                  text: 'Nearest Store',
                  icon: Appicons.location,
                  width: 120.w,
                ),
                buildcontainer(text: 'Vip', icon: Appicons.lock, width: 70.w),
                buildcontainer(
                  text: 'Return policy',
                  icon: Appicons.reply,
                  width: 120.w,
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                // Go to cart button
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(height: 60.h, width: 133.w),
                    Container(
                      height: 30.h,
                      width: 125.w,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Appcolors.litebluColor,
                            Appcolors.deepbluColor,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 30.w), // Leave space for icon
                            Text(
                              "Go To Cart",
                              style: TextStyle(
                                color: Appcolors.weightColor,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Circle Icon Above Row
                    Positioned(
                      right: 93.w,
                      bottom: 7.h,

                      child: Container(
                        height: 45.h, // Bigger than button height
                        width: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Appcolors.litebluColor,
                        ),
                        child: Icon(Icons.shopping_cart, color: Colors.white),
                      ),
                    ),
                  ],
                ),

                SizedBox(width: 12),

                // Buy Now button
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(height: 60.h, width: 133.w),
                    Container(
                      height: 30.h,
                      width: 125.w,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Appcolors.litegreenColor,
                            Appcolors.deepgreenColor,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 30.w), // Leave space for icon
                            Text(
                              "Buy Now",
                              style: TextStyle(
                                color: Appcolors.weightColor,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Circle Icon Above Row
                    Positioned(
                      right: 93.w,
                      bottom: 7.h,

                      child: Container(
                        height: 45.h, // Bigger than button height
                        width: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Appcolors.litegreenColor,
                        ),
                        child: Icon(Icons.touch_app, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildcontainer({
  required String text,
  required IconData icon,
  required double width,
}) {
  return Container(
    height: 35.h,
    width: width,
    decoration: BoxDecoration(
      color: Appcolors.weightColor,
      borderRadius: BorderRadius.circular(5.r),
      border: Border.all(color: Appcolors.blackColor.withOpacity(0.4)),
    ),
    child: Center(
      child: Row(
        children: [
          Icon(icon),
          Text(
            text,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    ),
  );
}
