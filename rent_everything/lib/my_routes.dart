import 'package:get/get.dart';
import 'package:rent_everything/car_details/car_details_responsive.dart';
import 'package:rent_everything/home_page/home_page_responsive.dart';
import 'package:rent_everything/login/login_responsive.dart';
import 'package:rent_everything/profile/profile_responsive.dart';
import 'package:rent_everything/register/register_responsive.dart';
import 'package:rent_everything/review/review_responsive.dart';
import 'package:rent_everything/verify_otp/verify_otp_responsive.dart';

import 'booking_conform/booking_conform_responsive.dart';
import 'booking_summary/booking_summary_responsive.dart';
import 'categories/categories_responsive.dart';
import 'checkout/checkout_responsive.dart';
import 'earning/earning_responsive.dart';
import 'notification/notification_responsive.dart';
import 'settings/settings_responsive.dart';
import 'wishlist/wishlist_responsive.dart';

var myRoutes = [
  GetPage(name: '/', page: () => LoginResponsive()),
  GetPage(name: '/register', page: () => RegisterResponsive()),
  GetPage(name: '/otp', page: () => VerifyOtpResponsive()),
  GetPage(name: '/home', page: () => HomePageResponsive()),
  GetPage(name: '/profile', page: () => const ProfileResponsive()),
  GetPage(name: '/wishlist', page: () => WishlistResponsive()),
  GetPage(name: '/notifications', page: () => NotificationResponsive()),
  GetPage(name: '/earnings', page: () => EarningResponsive()),
  GetPage(name: '/review', page: () => ReviewResponsive()),
  GetPage(name: '/settings', page: () => const SettingsResponsive()),
  GetPage(name: '/categories', page: () => const CategoriesResponsive()),
  GetPage(name: '/details', page: () => const CarDetailsResponsive()),
  GetPage(
    name: '/booking-summary',
    page: () => const BookingSummaryResponsive(),
  ),
  GetPage(name: '/checkout', page: () => const CheckoutResponsive()),
  GetPage(
    name: '/booking-conform',
    page: () => const BookingConformResponsive(),
  ),
];
