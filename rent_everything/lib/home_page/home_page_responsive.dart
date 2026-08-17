import 'package:flutter/material.dart';

import '../my_responsive.dart';
import 'home_page_desktop.dart';
import 'home_page_mobile.dart';
import 'home_page_tablet.dart';

class HomePageResponsive extends StatelessWidget {
  const HomePageResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return MyResponsive(
      mobileScreen: const HomePageMobile(),
      tabletScreen: const HomePageTablet(),
      desktopScreen: const HomePageDesktop(),
    );
  }
}
