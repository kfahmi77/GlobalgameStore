import 'package:cloud_firestore/cloud_firestore.dart';

class ProductService {
  static Future<List<Map<String, dynamic>>> searchProducts(String keyword) async {
    List<Map<String, dynamic>> searchResults = [];

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('product')
          .where('nama_produk', isGreaterThanOrEqualTo: keyword)
          .where('nama_produk', isLessThan: '${keyword}z')
          .get();

      for (var document in querySnapshot.docs) {
        searchResults.add(document.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error searching products: $e');
    }

    return searchResults;
  }
}