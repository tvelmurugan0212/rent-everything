import 'package:flutter/material.dart';

import '../my_responsive.dart';
import 'wishlist_desktop.dart';
import 'wishlist_mobile.dart';
import 'wishlist_tablet.dart';

class WishlistResponsive extends StatelessWidget {
  const WishlistResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return MyResponsive(
      mobileScreen: const WishlistMobile(),
      tabletScreen: const WishlistTablet(),
      desktopScreen: const WishlistDesktop(),
    );
  }
}
