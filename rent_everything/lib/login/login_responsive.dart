import 'package:flutter/material.dart';

import '../my_responsive.dart';
import 'login_desktop.dart';
import 'login_mobile.dart';
import 'login_tablet.dart';

class LoginResponsive extends StatelessWidget {
  const LoginResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return MyResponsive(
      mobileScreen: const LoginMobile(),
      tabletScreen: const LoginTablet(),
      desktopScreen: const LoginDesktop(),
    );
  }
}
