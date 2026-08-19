import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../my_responsive.dart';
import 'booking_summary_controller.dart';
import 'booking_summary_desktop.dart';
import 'booking_summary_mobile.dart';
import 'booking_summary_tablet.dart';

class BookingSummaryResponsive extends StatelessWidget {
  const BookingSummaryResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    Get.delete<BookingSummaryController>(force: true);
    Get.put(BookingSummaryController());

    return MyResponsive(
      mobileScreen: const BookingSummaryMobile(),
      tabletScreen: const BookingSummaryTablet(),
      desktopScreen: const BookingSummaryDesktop(),
    );
  }
}
