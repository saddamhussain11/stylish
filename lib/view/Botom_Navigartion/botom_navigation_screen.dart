import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/constant/appcolors.dart';
import 'package:stylish/constant/appicons.dart';
import 'package:stylish/view/Checkout/checkout_screen.dart';
import 'package:stylish/view/Favorite/favorite_screen.dart';
import 'package:stylish/view/Search/Search_screen.dart';
import 'package:stylish/view/home/home_screen.dart';
import 'package:stylish/view/profile/profile_screen.dart';
import 'package:stylish/view/user_list_screen.dart';

class BotomNavigationScreen extends StatefulWidget {
  @override
  _BottomNavWithFABState createState() => _BottomNavWithFABState();
}

class _BottomNavWithFABState extends State<BotomNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Center(child: HomeScreen()),
    Center(child: FavoriteScreen()),
    Center(child: UserListScreen()),
    Center(child: ProfileScreen()),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onFabPressed() {
    // Center FAB ka action
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Floating Action Button Pressed")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.weightColor,
      body: _screens[_selectedIndex],
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 10.h), // FAB thoda neechay
        child: FloatingActionButton(
          backgroundColor: Appcolors.weightColor,
          shape: CircleBorder(),
          onPressed: () {},
          child: Icon(Appicons.cart_shopping_outlined),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // ✅ BottomAppBar with full width navigation bar
      bottomNavigationBar: SizedBox(
        height: 80.h,
        child: BottomAppBar(
          padding: EdgeInsets.symmetric(horizontal: 0.w),
          color: Appcolors.weightColor,
          //  shape: CircularNotchedRectangle(),
          notchMargin: 6.0,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            currentIndex: _selectedIndex,
            selectedItemColor: Appcolors.pinkColor,
            unselectedItemColor: Colors.grey,
            onTap: _onItemTapped,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Appicons.favorite),
                label: 'WishList',
              ),
              BottomNavigationBarItem(
                icon: Icon(Appicons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Appicons.seting),
                label: 'Setting',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
