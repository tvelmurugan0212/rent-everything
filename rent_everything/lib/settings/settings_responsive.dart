import 'package:flutter/material.dart';

import '../my_responsive.dart';
import 'settings_desktop.dart';
import 'settings_mobile.dart';
import 'settings_tablet.dart';

class SettingsResponsive extends StatelessWidget {
  const SettingsResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return MyResponsive(
      mobileScreen: const SettingsMobile(),
      tabletScreen: const SettingsTablet(),
      desktopScreen: const SettingsDesktop(),
    );
  }
}
