import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_everything/my_responsive.dart';
import 'booking_conform_mobile.dart';
import 'booking_conform_tablet.dart';
import 'booking_conform_desktop.dart';

class BookingConformResponsive extends StatefulWidget {
  const BookingConformResponsive({super.key});

  @override
  State<BookingConformResponsive> createState() =>
      _BookingConformResponsiveState();
}

class _BookingConformResponsiveState extends State<BookingConformResponsive> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 2), () {
      if (mounted) {
        Get.offAllNamed('/home');
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyResponsive(
      mobileScreen: const BookingConformMobile(),
      tabletScreen: const BookingConformTablet(),
      desktopScreen: const BookingConformDesktop(),
    );
  }
}
