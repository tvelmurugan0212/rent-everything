import 'package:flutter/material.dart';

import '../my_responsive.dart';
import 'review_desktop.dart';
import 'review_mobile.dart';
import 'review_tablet.dart';

class ReviewResponsive extends StatelessWidget {
  const ReviewResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return MyResponsive(
      mobileScreen: const ReviewMobile(),
      tabletScreen: const ReviewTablet(),
      desktopScreen: const ReviewDesktop(),
    );
  }
}
