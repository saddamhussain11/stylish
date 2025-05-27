import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/constant/appicons.dart';
import 'package:stylish/constant/appimages.dart';
import 'package:stylish/widget/card/home/home_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> productList = [
    {
      'imagePath': Appimages.home2,
      'title': 'Women Printed Kurta',
      'description': 'Stylish printed kurta for women with soft fabric.',
      'price': 1500,
      'oldPrice': 2499,
      'discountText': '40% Off',
      'rating': 4.5,
      'totalReviews': 56890,
    },
    {
      'imagePath': Appimages.home1,
      'title': 'Men Denim Jacket',
      'description': 'Trendy denim jacket for casual look.',
      'price': 1999,
      'oldPrice': 2999,
      'discountText': '33% Off',
      'rating': 4.0,
      'totalReviews': 25600,
    },
    {
      'imagePath': Appimages.home2,
      'title': 'Kids Winter Set',
      'description': 'Warm and cozy winter wear for kids.',
      'price': 1200,
      'oldPrice': 2000,
      'discountText': '40% Off',
      'rating': 4.8,
      'totalReviews': 13000,
    },
    {
      'imagePath': Appimages.home1,
      'title': 'Sports Shoes',
      'description': 'Comfortable and stylish running shoes.',
      'price': 1800,
      'oldPrice': 3000,
      'discountText': '40% Off',
      'rating': 4.2,
      'totalReviews': 34000,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.h,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Icon(Appicons.menu),
        ),
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Image.asset(Appimages.stylishlogo),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: CircleAvatar(
              backgroundImage: AssetImage(Appimages.profile),
              radius: 20.r,
            ),
          ),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(Appimages.homecircle1),
                      radius: 20.r,
                    ),
                    Text('Beuty', style: TextStyle(fontSize: 10.sp)),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(Appimages.homecircle2),
                      radius: 20.r,
                    ),
                    Text('Fashion', style: TextStyle(fontSize: 10.sp)),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(Appimages.homecircle3),
                      radius: 20.r,
                    ),
                    Text('Kids', style: TextStyle(fontSize: 10.sp)),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(Appimages.homecircle4),
                      radius: 20.r,
                    ),
                    Text('Mens', style: TextStyle(fontSize: 10.sp)),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(Appimages.homecircle5),
                      radius: 20.r,
                    ),
                    Text('Womens', style: TextStyle(fontSize: 10.sp)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.h),
            GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(12),
              itemCount: productList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.7, // Adjust aspect ratio as needed
              ),
              itemBuilder: (context, index) {
                final product = productList[index];
                return HomeCard(
                  imagePath: product['imagePath'],
                  title: product['title'],
                  description: product['description'],
                  price: product['price'],
                  oldPrice: product['oldPrice'],
                  discountText: product['discountText'],
                  rating: product['rating'],
                  totalReviews: product['totalReviews'],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
