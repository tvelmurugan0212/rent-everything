import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingSummaryController extends GetxController {
  final pickupDate = Rxn<DateTime>();
  final returnDate = Rxn<DateTime>();

  final dateFormat = DateFormat('dd MMM yyyy');

  Future<void> selectPickupDate(BuildContext context) async {
    final now = DateTime.now();

    final selected = await showDatePicker(
      context: context,
      initialDate: pickupDate.value ?? now,
      firstDate: now,
      lastDate: DateTime(now.year + 2),
    );

    if (selected != null) {
      pickupDate.value = selected;

      if (returnDate.value != null && returnDate.value!.isBefore(selected)) {
        returnDate.value = selected;
      }
    }
  }

  Future<void> selectReturnDate(BuildContext context) async {
    final pickup = pickupDate.value;

    if (pickup == null) {
      Get.snackbar(
        'Select Pickup Date',
        'Please select the pickup date first.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final selected = await showDatePicker(
      context: context,
      initialDate: returnDate.value ?? pickup.add(const Duration(days: 1)),
      firstDate: pickup,
      lastDate: DateTime(pickup.year + 2),
    );

    if (selected != null) {
      returnDate.value = selected;
    }
  }

  String get pickupText {
    if (pickupDate.value == null) {
      return 'Select pickup date';
    }

    return dateFormat.format(pickupDate.value!);
  }

  String get returnText {
    if (returnDate.value == null) {
      return 'Select return date';
    }

    return dateFormat.format(returnDate.value!);
  }
}
