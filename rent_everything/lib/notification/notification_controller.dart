import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:rent_everything/services/auth_service.dart';

class NotificationController extends GetxController {
  final notifications = <Map<String, dynamic>>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchNotifications();
  }

  void fetchNotifications() {
    isLoading.value = true;
    FirebaseFirestore.instance
        .collection('notifications')
        .where('userId', isEqualTo: AuthService.instance.userId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .listen(
      (snapshot) {
        notifications.value = snapshot.docs
            .map((doc) => {'id': doc.id, ...doc.data()})
            .toList();
        isLoading.value = false;
      },
      onError: (error) {
        isLoading.value = false;
      },
    );
  }

  String getTimeAgo(dynamic createdAt) {
    if (createdAt == null) return '';
    DateTime time;
    if (createdAt is Timestamp) {
      time = createdAt.toDate();
    } else if (createdAt is DateTime) {
      time = createdAt;
    } else {
      return '';
    }

    final diff = DateTime.now().difference(time);
    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes} min ago';
    if (diff.inHours < 24) return '${diff.inHours} hr ago';
    if (diff.inDays < 7) return '${diff.inDays} day${diff.inDays > 1 ? 's' : ''} ago';
    return '${(diff.inDays / 7).floor()} week${(diff.inDays / 7).floor() > 1 ? 's' : ''} ago';
  }

  Future<void> markAsRead(String notificationId) async {
    await FirebaseFirestore.instance
        .collection('notifications')
        .doc(notificationId)
        .update({'isRead': true});
  }
}
