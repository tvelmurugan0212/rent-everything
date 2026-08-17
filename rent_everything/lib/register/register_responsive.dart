import 'package:flutter/material.dart';

import '../my_responsive.dart';
import 'register_desktop.dart';
import 'register_mobile.dart';
import 'register_tablet.dart';

class RegisterResponsive extends StatelessWidget {
  const RegisterResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return MyResponsive(
      mobileScreen: const RegisterMobile(),
      tabletScreen: const RegisterTablet(),
      desktopScreen: const RegisterDesktop(),
    );
  }
}
