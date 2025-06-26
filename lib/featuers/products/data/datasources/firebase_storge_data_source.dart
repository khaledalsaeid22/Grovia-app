// في ملف: lib/features/products/data/datasources/firebase_storage_data_source.dart

import 'dart:io'; // عشان File (ممكن تستخدم XFile لو بتيجي من image_picker)
import 'package:firebase_storage/firebase_storage.dart'; // عشان FirebaseStorage
import 'package:image_picker/image_picker.dart'; // عشان XFile لو هتستخدمها

abstract class FirebaseStorageDataSource {
  Future<String> uploadProductImage(XFile imageFile, String productId);
}

class FirebaseStorageDataSourceImpl implements FirebaseStorageDataSource {
  final FirebaseStorage firebaseStorage;

  FirebaseStorageDataSourceImpl({required this.firebaseStorage});

  @override
  Future<String> uploadProductImage(XFile imageFile, String productId) async {
    try {
      final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
      final storageRef = firebaseStorage.ref().child(
        'product_images/$productId/$fileName',
      );

      final uploadTask = await storageRef.putFile(
        File(imageFile.path),
      ); // التحويل من XFile.path لـ File

      final imageUrl = await uploadTask.ref.getDownloadURL();
      return imageUrl;
    } on FirebaseException catch (e) {
      throw Exception('Firebase Storage Error: ${e.message}');
    } catch (e) {
      throw Exception('Failed to upload product image: $e');
    }
  }
}
