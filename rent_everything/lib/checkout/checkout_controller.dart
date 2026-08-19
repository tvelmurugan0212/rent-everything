import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CheckoutController extends GetxController {
  final selectedPayment = 'PhonePe'.obs;
  final Rxn<Map<String, dynamic>> product = Rxn<Map<String, dynamic>>();
  final RxBool isLoading = true.obs;
  final RxBool isBooking = false.obs;

  final dateFormat = DateFormat('dd MMM yyyy');
  StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>? _productSub;

  String _productId = '';
  DateTime? pickupDate;
  DateTime? returnDate;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args is Map) {
      _productId = args['id']?.toString() ?? '';
      if (args['pickupDate'] != null) {
        pickupDate = DateTime.tryParse(args['pickupDate'].toString());
      }
      if (args['returnDate'] != null) {
        returnDate = DateTime.tryParse(args['returnDate'].toString());
      }
    }
    if (_productId.isNotEmpty) {
      fetchProduct();
    } else {
      isLoading.value = false;
    }
  }

  void selectPayment(String value) {
    selectedPayment.value = value;
  }

  void fetchProduct() {
    _productSub = FirebaseFirestore.instance
        .collection('products')
        .doc(_productId)
        .snapshots()
        .listen(
      (docSnapshot) {
        if (docSnapshot.exists) {
          product.value = {'id': docSnapshot.id, ...docSnapshot.data()!};
        }
        isLoading.value = false;
      },
      onError: (error) {
        isLoading.value = false;
      },
    );
  }

  // --- Getters ---
  String get imageUrl => product.value?['imageUrl'] ?? '';
  String get productName => product.value?['productName'] ?? '';
  double get rentalPrice => (product.value?['rentalPrice'] ?? 0).toDouble();
  double get securityDeposit =>
      (product.value?['securityDeposit'] ?? 0).toDouble();
  String get city => product.value?['pickupCity'] ?? '';

  double get serviceFee => 100;

  int get numberOfDays {
    if (pickupDate == null || returnDate == null) return 1;
    return returnDate!.difference(pickupDate!).inDays.clamp(1, 999);
  }

  double get rentalCharge => rentalPrice * numberOfDays;
  double get totalAmount => rentalCharge + serviceFee + securityDeposit;

  String get pickupText =>
      pickupDate != null ? dateFormat.format(pickupDate!) : 'Not selected';
  String get returnText =>
      returnDate != null ? dateFormat.format(returnDate!) : 'Not selected';

  String get durationText => '$numberOfDays Day${numberOfDays > 1 ? 's' : ''}';

  String get payAmount {
    final formatted = totalAmount.toStringAsFixed(0);
    return '₹$formatted';
  }

  // --- Create Booking ---
  Future<void> createBooking() async {
    if (_productId.isEmpty) return;
    if (pickupDate == null || returnDate == null) return;

    isBooking.value = true;

    // Check for date overlap with existing bookings for this product
    final bool hasOverlap = await _checkDateOverlap();
    if (hasOverlap) {
      isBooking.value = false;
      Get.snackbar(
        'Dates Unavailable',
        'This vehicle is already booked for the selected dates. Please choose different dates.',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('bookings').add({
        'productId': _productId,
        'productName': productName,
        'imageUrl': imageUrl,
        'rentalPrice': rentalPrice,
        'securityDeposit': securityDeposit,
        'pickupCity': city,
        'pickupDate': pickupDate?.toIso8601String(),
        'returnDate': returnDate?.toIso8601String(),
        'numberOfDays': numberOfDays,
        'rentalCharge': rentalCharge,
        'serviceFee': serviceFee,
        'totalAmount': totalAmount,
        'paymentMethod': selectedPayment.value,
        'status': 'confirmed',
        'createdAt': FieldValue.serverTimestamp(),
      });

      isBooking.value = false;
    } catch (e) {
      isBooking.value = false;
      Get.snackbar(
        'Error',
        'Failed to create booking. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    _showSuccessDialog();
  }

  // Two ranges overlap when: newStart <= existingEnd AND newEnd >= existingStart
  Future<bool> _checkDateOverlap() async {
    final newStart = pickupDate!;
    final newEnd = returnDate!;

    final snapshot = await FirebaseFirestore.instance
        .collection('bookings')
        .where('productId', isEqualTo: _productId)
        .where('status', isEqualTo: 'confirmed')
        .get();

    for (final doc in snapshot.docs) {
      final data = doc.data();
      final existingPickup = DateTime.tryParse(data['pickupDate'] ?? '');
      final existingReturn = DateTime.tryParse(data['returnDate'] ?? '');

      if (existingPickup == null || existingReturn == null) continue;

      // Overlap: newStart <= existingEnd AND newEnd >= existingStart
      if (!newStart.isAfter(existingReturn) &&
          !newEnd.isBefore(existingPickup)) {
        return true;
      }
    }

    return false;
  }

  void _showSuccessDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  color: Color(0xFFE8F5E9),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_rounded,
                  size: 40,
                  color: Color(0xFF4CAF50),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Booking Confirmed!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF202938),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Your booking has been successfully placed.\nYou will receive a confirmation shortly.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF5F5F5F),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    Get.back(); // close dialog
                    Get.offAllNamed('/home'); // go to home
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0674A1),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Back to Home',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  @override
  void onClose() {
    _productSub?.cancel();
    super.onClose();
  }
}
