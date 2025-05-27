import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/constant/appcolors.dart';
import 'package:stylish/constant/appicons.dart';

class FavoriteCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final int price;

  final double rating;
  final int totalReviews;

  const FavoriteCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,

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
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Text Section
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.h),
                child: Column(
                  spacing: 1.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
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
                    SizedBox(height: 5.h),
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
