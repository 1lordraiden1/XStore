import 'package:get/get.dart';
import 'package:xstore/features/auth/screens/login/forget_pass.dart';
import 'package:xstore/features/auth/screens/login/login.dart';
import 'package:xstore/features/auth/screens/onboarding/onboarding.dart';
import 'package:xstore/features/auth/screens/signup/signup.dart';
import 'package:xstore/features/personalization/screens/profile/profile.dart';
import 'package:xstore/features/personalization/screens/settings/setting.dart';
import 'package:xstore/features/shop/screens/cart/cart.dart';
import 'package:xstore/features/shop/screens/home/home.dart';
import 'package:xstore/features/shop/screens/shop/shop.dart';
import 'package:xstore/features/shop/screens/wishlist.dart';
import 'package:xstore/utils/routers/routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(
      name: XRoutes.home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: XRoutes.cart,
      page: () => const CartScreen(),
    ),
    GetPage(
      name: XRoutes.store,
      page: () => const ShopScreen(),
    ),
    GetPage(
      name: XRoutes.favorites,
      page: () => const WishlistScreen(),
    ),
    GetPage(
      name: XRoutes.settings,
      page: () => const SettingScreen(),
    ),
    GetPage(
      name: XRoutes.order,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: XRoutes.userProfile,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: XRoutes.signup,
      page: () => const SignupScreen(),
    ),
    GetPage(
      name: XRoutes.forgetPass,
      page: () => const ForgetPassScreen(),
    ),
    GetPage(
      name: XRoutes.signin,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: XRoutes.onBoarding,
      page: () => const OnBoardingScreen(),
    ),
  ];
}
