import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/res/constant/appicons.dart';
import 'package:stylish/res/constant/appimages.dart';
import 'package:stylish/res/components/card/favorite/favorite_card.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final List<Map<String, dynamic>> favoriteDressList = [
    {
      'imagePath': Appimages.favorite,
      'title': 'Floral Summer Dress',
      'description': 'Lightweight floral dress perfect for summer.',
      'price': 999,
      'rating': 4.5,
      'totalReviews': 1345,
    },
    {
      'imagePath': Appimages.favorite2,
      'title': 'Evening Gown',
      'description': 'Elegant gown for special occasions.',
      'price': 2599,
      'rating': 4.8,
      'totalReviews': 2300,
    },
    {
      'imagePath': Appimages.favorite3,
      'title': 'Casual Maxi Dress',
      'description': 'Comfortable everyday wear.',
      'price': 1499,
      'rating': 4.2,
      'totalReviews': 980,
    },
    {
      'imagePath': Appimages.favorite4,
      'title': 'Bodycon Party Dress',
      'description': 'Stylish bodycon perfect for night outs.',
      'price': 1899,
      'rating': 4.6,
      'totalReviews': 1600,
    },
    {
      'imagePath': Appimages.favorite5,
      'title': 'Ethnic Kurti',
      'description': 'Traditional yet trendy ethnic wear.',
      'price': 799,
      'rating': 4.0,
      'totalReviews': 2000,
    },
    {
      'imagePath': Appimages.favorite6,
      'title': 'Sleeveless Midi Dress',
      'description': 'Great for formal and semi-formal events.',
      'price': 1199,
      'rating': 4.3,
      'totalReviews': 1150,
    },
    {
      'imagePath': Appimages.favorite7,
      'title': 'Printed Long Dress',
      'description': 'Chic prints with vibrant colors.',
      'price': 1349,
      'rating': 4.4,
      'totalReviews': 980,
    },
    {
      'imagePath': Appimages.favorite8,
      'title': 'Wrap Dress',
      'description': 'Soft fabric, comfortable and stylish.',
      'price': 1099,
      'rating': 4.1,
      'totalReviews': 890,
    },
    {
      'imagePath': Appimages.favorite11,
      'title': 'Denim Shirt Dress',
      'description': 'Trendy and versatile for any season.',
      'price': 1599,
      'rating': 4.7,
      'totalReviews': 1765,
    },
    {
      'imagePath': Appimages.favorite10,
      'title': 'Lace Overlay Dress',
      'description': 'Elegant lace with body-fit style.',
      'price': 1999,
      'rating': 4.9,
      'totalReviews': 2100,
    },
    {
      'imagePath': Appimages.favorite11,
      'title': 'Pleated Midi Dress',
      'description': 'Perfect for office or casual lunch.',
      'price': 1399,
      'rating': 4.3,
      'totalReviews': 1000,
    },
    {
      'imagePath': Appimages.favorite12,
      'title': 'Ruffle Sleeve Dress',
      'description': 'Stylish and flowy design.',
      'price': 1249,
      'rating': 4.0,
      'totalReviews': 875,
    },
    {
      'imagePath': Appimages.favorite14,
      'title': 'Tiered Maxi Dress',
      'description': 'Layered look for a modern touch.',
      'price': 1449,
      'rating': 4.6,
      'totalReviews': 1240,
    },
    {
      'imagePath': Appimages.favorite,
      'title': 'Off-Shoulder Dress',
      'description': 'Trendy style with flattering fit.',
      'price': 1699,
      'rating': 4.8,
      'totalReviews': 1950,
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
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(12),
              itemCount: favoriteDressList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.8, // Adjust aspect ratio as needed
              ),
              itemBuilder: (context, index) {
                final product = favoriteDressList[index];
                return FavoriteCard(
                  imagePath: product['imagePath'],
                  title: product['title'],
                  description: product['description'],
                  price: product['price'],
                  rating: product['rating'],
                  totalReviews: product['totalReviews'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
