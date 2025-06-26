import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grovia/featuers/products/data/models/product_model.dart';

abstract class FirestoreProductDataSource {
  Future<ProductModel> addProduct(ProductModel product);
  Future<void> updateProduct(String productId, Map<String, dynamic> data);
  Future<List<ProductModel>> getProducts(String merchantId);
  Future<void> deleteProduct(String productId);
}

class FirestoreProductDataSourceImpl implements FirestoreProductDataSource {
  final FirebaseFirestore firestore;

  FirestoreProductDataSourceImpl({required this.firestore});
  @override
  Future<ProductModel> addProduct(ProductModel product) async {
    try {
      await firestore
          .collection('products')
          .doc(product.id)
          .set(product.toJson());

      return product;
    } catch (e) {
      throw Exception('Failed to add product: $e');
    }
  }

  @override
  Future<void> deleteProduct(String productId) {
    try {
      return firestore.collection('products').doc(productId).delete();
    } catch (e) {
      throw Exception('Failed to delete product: $e');
    }
  }

  @override
  Future<List<ProductModel>> getProducts(String merchantId) async {
    try {
      final productSnapshot = await firestore
          .collection('products')
          .where('merchantId', isEqualTo: merchantId)
          .get();
      return productSnapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data()!))
          .toList();
    } catch (e) {
      throw Exception('Failed to get products: $e');
    }
  }

  @override
  Future<void> updateProduct(
    String productId,
    Map<String, dynamic> data,
  ) async {
    try {
      await firestore.collection('products').doc(productId).update(data);
    } catch (e) {
      throw Exception('Failed to update product: $e');
    }
  }
}
