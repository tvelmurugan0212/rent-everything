import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingController extends GetxController {
  final RxInt selectedTab = 1.obs;
  final RxList<Map<String, dynamic>> bookings = <Map<String, dynamic>>[].obs;
  final RxBool isLoading = true.obs;

  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? _bookingsSub;

  final dateFormat = DateFormat('dd MMM');

  @override
  void onInit() {
    super.onInit();
    fetchBookings();
  }

  void changeTab(int index) {
    selectedTab.value = index;
  }

  void fetchBookings() {
    _bookingsSub = FirebaseFirestore.instance
        .collection('bookings')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .listen(
          (snapshot) {
            bookings.value = snapshot.docs
                .map((doc) => {'id': doc.id, ...doc.data()})
                .toList();
            isLoading.value = false;
          },
          onError: (error) {
            isLoading.value = false;
          },
        );
  }

  String formatDates(String? pickupIso, String? returnIso) {
    if (pickupIso == null || returnIso == null) return 'Dates not set';
    final pickup = DateTime.tryParse(pickupIso);
    final ret = DateTime.tryParse(returnIso);
    if (pickup == null || ret == null) return 'Dates not set';
    return '${dateFormat.format(pickup)} - ${dateFormat.format(ret)}';
  }

  @override
  void onClose() {
    _bookingsSub?.cancel();
    super.onClose();
  }
}
