import 'package:flutter/material.dart';

import '../my_responsive.dart';
import 'earning_desktop.dart';
import 'earning_mobile.dart';
import 'earning_tablet.dart';

class EarningResponsive extends StatelessWidget {
  const EarningResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return MyResponsive(
      mobileScreen: const EarningMobile(),
      tabletScreen: const EarningTablet(),
      desktopScreen: const EarningDesktop(),
    );
  }
}
