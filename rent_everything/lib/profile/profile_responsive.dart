import 'package:flutter/material.dart';

import '../my_responsive.dart';
import 'profile_desktop.dart';
import 'profile_mobile.dart';
import 'profile_tablet.dart';

class ProfileResponsive extends StatelessWidget {
  const ProfileResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return MyResponsive(
      mobileScreen: const ProfileMobile(),
      tabletScreen: const ProfileTablet(),
      desktopScreen: const ProfileDesktop(),
    );
  }
}
