import 'package:flutter/material.dart';

import '../my_responsive.dart';
import 'booking_summary_desktop.dart';
import 'booking_summary_mobile.dart';
import 'booking_summary_tablet.dart';

class BookingSummaryResponsive extends StatelessWidget {
  const BookingSummaryResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return MyResponsive(
      mobileScreen: BookingSummaryMobile(),
      tabletScreen: const BookingSummaryTablet(),
      desktopScreen: const BookingSummaryDesktop(),
    );
  }
}
