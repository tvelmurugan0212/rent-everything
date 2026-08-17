import 'package:get/get.dart';
import 'package:rent_everything/home_page/home_page_responsive.dart';
import 'package:rent_everything/login/login_responsive.dart';
import 'package:rent_everything/register/register_responsive.dart';
import 'package:rent_everything/verify_otp/verify_otp_responsive.dart';

var myRoutes = [
  GetPage(name: '/', page: () => LoginResponsive()),
  GetPage(name: '/register', page: () => RegisterResponsive()),
  GetPage(name: '/otp', page: () => VerifyOtpResponsive()),
  GetPage(name: '/home', page: () => HomePageResponsive()),
];
