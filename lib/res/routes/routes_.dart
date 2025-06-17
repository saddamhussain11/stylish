import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:stylish/res/routes/routes_names.dart';
import 'package:stylish/view/Checkout/checkout_screen.dart';
import 'package:stylish/view/Detail/detail_screen.dart';
import 'package:stylish/view/Favorite/favorite_screen.dart';
import 'package:stylish/view/Search/Search_screen.dart';
import 'package:stylish/view/Shoping_Bag/shoping_bag_screen.dart';
import 'package:stylish/view/auth/login_screen.dart';
import 'package:stylish/view/auth/onboarding.dart';
import 'package:stylish/view/auth/signup_screen.dart';
import 'package:stylish/view/auth/splash_screen.dart';
import 'package:stylish/view/home/home_screen.dart';
import 'package:stylish/view/profile/profile_screen.dart';
import 'package:stylish/view/user_list_screen.dart';

class Routes {
  static approutes() => [
        GetPage(name: RoutesNames.splashScreen, page: () => SplashScreen()),
        GetPage(name: RoutesNames.detailscreen, page: () => DetailScreen()),
        GetPage(name: RoutesNames.profilescreen, page: () => ProfileScreen()),
        GetPage(name: RoutesNames.loginScreen, page: () => LoginScreen()),
        GetPage(name: RoutesNames.signupScreen, page: () => SignupScreen()),
        GetPage(name: RoutesNames.homescreen, page: () => HomeScreen()),
        GetPage(name: RoutesNames.onboardingscreen, page: () => Onboarding()),
        GetPage(name: RoutesNames.checkoutscreen, page: () => CheckoutScreen()),
        GetPage(name: RoutesNames.favoritescreen, page: () => FavoriteScreen()),
        GetPage(name: RoutesNames.searchscreen, page: () => SearchScreen()),
        GetPage(
            name: RoutesNames.shopingbagscreen, page: () => ShopingBagScreen()),
        GetPage(name: RoutesNames.userlistscreen, page: () => UserListScreen()),
      ];
}
