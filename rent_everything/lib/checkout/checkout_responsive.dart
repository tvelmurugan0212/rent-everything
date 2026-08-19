import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_everything/my_responsive.dart';
import 'checkout_controller.dart';
import 'checkout_mobile.dart';
import 'checkout_tablet.dart';
import 'checkout_desktop.dart';

class CheckoutResponsive extends StatelessWidget {
  const CheckoutResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    Get.delete<CheckoutController>(force: true);
    Get.put(CheckoutController());

    return MyResponsive(
      mobileScreen: const CheckoutMobile(),
      tabletScreen: CheckoutTablet(),
      desktopScreen: CheckoutDesktop(),
    );
  }
}
