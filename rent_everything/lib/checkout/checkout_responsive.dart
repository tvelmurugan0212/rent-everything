import 'package:flutter/material.dart';
import 'package:rent_everything/my_responsive.dart';
import 'checkout_mobile.dart';
import 'checkout_tablet.dart';
import 'checkout_desktop.dart';

class CheckoutResponsive extends StatelessWidget {
  const CheckoutResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return MyResponsive(
      mobileScreen: CheckoutMobile(),
      tabletScreen: CheckoutTablet(),
      desktopScreen: CheckoutDesktop(),
    );
  }
}
