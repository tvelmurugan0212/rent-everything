import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  final RxList<Map<String, dynamic>> wishlistProducts =
      <Map<String, dynamic>>[].obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchWishlist();
  }

  void fetchWishlist() {
    FirebaseFirestore.instance
        .collection('products')
        .where('isWishlist', isEqualTo: true)
        .snapshots()
        .listen(
      (snapshot) {
        wishlistProducts.value = snapshot.docs
            .map((doc) => {'id': doc.id, ...doc.data()})
            .toList();
        isLoading.value = false;
      },
      onError: (error) {
        isLoading.value = false;
      },
    );
  }

  Future<void> removeFromWishlist(String productId) async {
    await FirebaseFirestore.instance
        .collection('products')
        .doc(productId)
        .update({'isWishlist': false});
  }

  static String getImageUrl(Map<String, dynamic> product) {
    return product['imageUrl'] ?? '';
  }
}
