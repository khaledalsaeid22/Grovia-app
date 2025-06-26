import 'package:dartz/dartz.dart';
import 'package:grovia/core/errors/errors.dart';
import 'package:grovia/featuers/products/data/datasources/Firestore_product_data_source.dart';
import 'package:grovia/featuers/products/data/datasources/firebase_storge_data_source.dart';
import 'package:grovia/featuers/products/data/models/product_model.dart';
import 'package:grovia/featuers/products/domain/entities/product.dart';
import 'package:grovia/featuers/products/domain/repositories/product_repo.dart';
import 'package:grovia/featuers/products/domain/usecases/params/add_product_params.dart';
import 'package:grovia/featuers/products/domain/usecases/params/update_product_params.dart';
import 'package:uuid/uuid.dart';

class ProductRepositoryImpl implements ProductRepo {
  final FirestoreProductDataSource firestoreProductDataSource;
  final FirebaseStorageDataSource firebaseStorageDataSource;

  ProductRepositoryImpl({
    required this.firestoreProductDataSource,
    required this.firebaseStorageDataSource,
  });

  @override
  Future<Either<Failure, Product>> addProduct(AddProductParams params) async {
    try {
      String? imageUrl;
      final newProductId = const Uuid().v4();

      if (params.imageFile != null) {
        imageUrl = await firebaseStorageDataSource.uploadProductImage(
          params.imageFile!,
          newProductId,
        );
      }
      final productToAdd = ProductModel(
        id: newProductId,
        name: params.name,
        description: params.description,
        price: params.price,
        cost: params.cost,
        categoryId: params.categoryId,
        merchantId: params.merchantId,
        createdAt: DateTime.now(),
        productLink: params.productLink,
        imageUrl: imageUrl,
        storeId: params.storeId,
        rating: params.rating,
        discount: params.discount,
      );
      final addProductModel = await firestoreProductDataSource.addProduct(
        productToAdd,
      );
      return Right(addProductModel);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct(String productId) async {
    try {
      await firestoreProductDataSource.deleteProduct(productId);

      return Right(null);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProducts(String merchantId) async {
    try {
      final productModels = await firestoreProductDataSource.getProducts(
        merchantId,
      );
      return Right(productModels.cast<Product>().toList());
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Product>> updateProduct(
    UpdateProductParams params,
  ) async {
    try {
      String? updateImageUrl;
      if (params.newImageFile != null) {
        updateImageUrl = await firebaseStorageDataSource.uploadProductImage(
          params.newImageFile!,
          params.id,
        );
      } else {
        updateImageUrl = params.existingImageUrl;
      }
      final Map<String, dynamic> updatedData = {
        'name': params.name,
        'description': params.description,
        'price': params.price,
        'cost': params.cost,
        'categoryId': params.categoryId,
        'merchantId': params.merchantId,
        'productLink': params.productLink,
        'imageUrl': updateImageUrl,
        'storeId': params.storeId,
        'rating': params.rating,
        'discount': params.discount,
      };

      updatedData.removeWhere((key, value) => value == null);

      await firestoreProductDataSource.updateProduct(params.id, updatedData);

      final updatedProduct = ProductModel(
        id: params.id,
        name: params.name ?? 'Product',
        description: params.description ?? 'No description',
        price: params.price ?? 0.0,
        cost: params.cost ?? 0.0,
        categoryId: params.categoryId ?? '',
        merchantId: params.merchantId ?? '',
        createdAt: DateTime.now(),
        productLink: params.productLink ?? '',
        imageUrl: updateImageUrl,
        storeId: params.storeId,
        rating: params.rating ?? 0.0,
        discount: params.discount ?? 0.0,
      );
      return Right(updatedProduct);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
