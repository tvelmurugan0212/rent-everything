import 'package:flutter/material.dart';

import '../my_responsive.dart';
import 'categories_desktop.dart';
import 'categories_mobile.dart';
import 'categories_tablet.dart';

class CategoriesResponsive extends StatelessWidget {
  const CategoriesResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return MyResponsive(
      mobileScreen: const CategoriesMobile(),
      tabletScreen: const CategoriesTablet(),
      desktopScreen: const CategoriesDesktop(),
    );
  }
}
