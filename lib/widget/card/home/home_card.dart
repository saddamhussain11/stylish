import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/res/constant/appcolors.dart';
import 'package:stylish/res/constant/appicons.dart';

class HomeCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final double price;
  final int? oldPrice;
  final String discountText;
  final double rating;
  final int totalReviews;

  const HomeCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
    this.oldPrice,
    required this.discountText,
    required this.rating,
    required this.totalReviews,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.sp,
      child: Container(
        height: 230.h,
        width: 140.w,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
        child: Column(
          children: [
            // Image Section
            Container(
              height: 100.h,
              width: 140.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Text Section
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Icon(Appicons.rupee, size: 14.sp),
                        Text(
                          '$price',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '₹$oldPrice',
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              discountText,
                              style: TextStyle(
                                color: Appcolors.pinkColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        ...List.generate(
                          rating.floor(),
                          (index) => Icon(
                            Icons.star,
                            color: Appcolors.amber,
                            size: 14,
                          ),
                        ),
                        if (rating % 1 != 0)
                          Icon(
                            Icons.star_half,
                            color: Appcolors.amber,
                            size: 14,
                          ),
                        SizedBox(width: 4),
                        Text(
                          '$totalReviews',
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
