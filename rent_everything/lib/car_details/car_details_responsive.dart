import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../my_responsive.dart';
import 'car_details_controller.dart';
import 'car_details_desktop.dart';
import 'car_details_mobile.dart';
import 'car_details_tablet.dart';

class CarDetailsResponsive extends StatelessWidget {
  const CarDetailsResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    Get.delete<CarDetailsController>(force: true);
    Get.put(CarDetailsController());

    return MyResponsive(
      mobileScreen: const CarDetailsMobile(),
      tabletScreen: const CarDetailsTablet(),
      desktopScreen: const CarDetailsDesktop(),
    );
  }
}
