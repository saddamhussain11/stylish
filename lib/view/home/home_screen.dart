import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stylish/res/components/Exaption/internet_excaption_widget.dart';
import 'package:stylish/res/constant/appicons.dart';
import 'package:stylish/res/constant/appimages.dart';
import 'package:stylish/view_model/controller/backend/product_controller.dart';
import 'package:stylish/model/product_model.dart';
import 'package:stylish/view/Detail/detail_screen.dart';
import 'package:stylish/res/components/card/home/home_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductController productController = Get.put(ProductController());
  @override
  void initState() {
    productController.getproduct();
    super.initState();
  }

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
        body: InternetExcaptionWidget(
          ontap: () {},
        )

        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 6.w),
        //   child: Column(
        //     children: [
        //       SizedBox(height: 10.h),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //         children: [
        //           Column(
        //             children: [
        //               CircleAvatar(
        //                 backgroundImage: AssetImage(Appimages.homecircle1),
        //                 radius: 20.r,
        //               ),
        //               Text('Beuty', style: TextStyle(fontSize: 10.sp)),
        //             ],
        //           ),
        //           Column(
        //             children: [
        //               CircleAvatar(
        //                 backgroundImage: AssetImage(Appimages.homecircle2),
        //                 radius: 20.r,
        //               ),
        //               Text('Fashion', style: TextStyle(fontSize: 10.sp)),
        //             ],
        //           ),
        //           Column(
        //             children: [
        //               CircleAvatar(
        //                 backgroundImage: AssetImage(Appimages.homecircle3),
        //                 radius: 20.r,
        //               ),
        //               Text('Kids', style: TextStyle(fontSize: 10.sp)),
        //             ],
        //           ),
        //           Column(
        //             children: [
        //               CircleAvatar(
        //                 backgroundImage: AssetImage(Appimages.homecircle4),
        //                 radius: 20.r,
        //               ),
        //               Text('Mens', style: TextStyle(fontSize: 10.sp)),
        //             ],
        //           ),
        //           Column(
        //             children: [
        //               CircleAvatar(
        //                 backgroundImage: AssetImage(Appimages.homecircle5),
        //                 radius: 20.r,
        //               ),
        //               Text('Womens', style: TextStyle(fontSize: 10.sp)),
        //             ],
        //           ),
        //         ],
        //       ),
        //       SizedBox(height: 20.h),
        //       Obx(() {
        //         if (productController.isLoading.value) {
        //           return const Center(
        //             child: CupertinoActivityIndicator(radius: 30),
        //           );
        //         } else if (productController.productlist.isEmpty
        //             //  productController.productlist.isEmpty
        //             ) {
        //           return const Center(child: Text('No Product Found'));
        //         } else {
        //           return GridView.builder(
        //             padding: const EdgeInsets.all(12),
        //             shrinkWrap: true,
        //             itemCount: 1,
        //             // productController.productlist.length,
        //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //               crossAxisCount: 2,
        //               mainAxisSpacing: 10,
        //               crossAxisSpacing: 10,
        //               childAspectRatio: 0.7,
        //             ),
        //             itemBuilder: (context, index) {
        //               final product = productController.productlist[index];
        //               return InkWell(
        //                 onTap: () {
        //                   Get.to(
        //                     DetailScreen(),
        //                     arguments: productController.productlist[index],
        //                   );
        //                   // optional
        //                 },
        //                 child: HomeCard(
        //                   imagePath: product.image ?? '',
        //                   title: product.title ?? '',
        //                   description: product.description ?? '',
        //                   price: double.parse(product.price.toString()) ?? 0.0,
        //                   oldPrice: 0,
        //                   discountText: '50% OFF', // if needed
        //                   rating: product.rating!.rate!.toDouble(),

        //                   // optional
        //                   totalReviews: product.rating!.count!.toInt(),
        //                 ),
        //               );
        //             },
        //           );
        //         }
        //       }),
        //     ],
        //   ),
        // ),
        );
  }
}
