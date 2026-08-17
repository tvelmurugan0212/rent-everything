import 'package:flutter/material.dart';

import '../my_responsive.dart';
import 'verify_otp_desktop.dart';
import 'verify_otp_mobile.dart';
import 'verify_otp_tablet.dart';

class VerifyOtpResponsive extends StatelessWidget {
  const VerifyOtpResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return MyResponsive(
      mobileScreen: const VerifyOtpMobile(),
      tabletScreen: const VerifyOtpTablet(),
      desktopScreen: const VerifyOtpDesktop(),
    );
  }
}
