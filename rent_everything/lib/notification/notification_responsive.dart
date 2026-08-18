import 'package:flutter/material.dart';

import '../my_responsive.dart';
import 'notification_desktop.dart';
import 'notification_mobile.dart';
import 'notification_tablet.dart';

class NotificationResponsive extends StatelessWidget {
  const NotificationResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return MyResponsive(
      mobileScreen: const NotificationMobile(),
      tabletScreen: const NotificationTablet(),
      desktopScreen: const NotificationDesktop(),
    );
  }
}
