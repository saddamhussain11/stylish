import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/res/constant/appcolors.dart';
import 'package:stylish/res/constant/appicons.dart';
import 'package:stylish/res/constant/appimages.dart';
import 'package:stylish/widget/card/checkout/checkout_card.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final List<Map<String, dynamic>> dummyData = [
    {
      "image": Appimages.home1,
      "title": "Women’s Casual Wear",
      "variations": ["Black", "Red"],
      "rating": 4.5,
      "price": 34.00,
      "oldPrice": 64.00,
      "off": "33%",
      "orderCount": 1,
    },
    {
      "image": Appimages.home2,
      "title": "Men’s Stylish Jacket",
      "variations": ["Blue", "Grey"],
      "rating": 4.2,
      "price": 55.00,
      "oldPrice": 80.00,
      "off": "31%",
      "orderCount": 1,
    },
    {
      "image": Appimages.favorite3,
      "title": "Kids Winter Suit",
      "variations": ["Pink", "Yellow"],
      "rating": 4.8,
      "price": 29.00,
      "oldPrice": 50.00,
      "off": "42%",
      "orderCount": 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.weightColor,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Text(
                'Cart List',
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.all(10.w),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: dummyData.length,
                  itemBuilder: (context, index) {
                    final item = dummyData[index];
                    return CheckoutCard(
                      image: item["image"],
                      title: item["title"],
                      variations: item["variations"],
                      rating: item["rating"],
                      price: item["price"],
                      oldPrice: item["oldPrice"],
                      off: item["off"],
                      orderCount: item["orderCount"],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
