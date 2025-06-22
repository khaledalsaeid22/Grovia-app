import 'package:dartz/dartz.dart';
import 'package:grovia/core/errors/errors.dart';
import 'package:grovia/featuers/products/domain/entities/product.dart';

abstract class ProductAuth {
  Future<Either<Failure, Product>> addProduct(Product product);
  Future<Either<Failure, Product>> updateProduct(Product product);
  Future<Either<Failure, List<Product>>> getProducts(String merchantId);
  Future<Either<Failure, void>> deleteProduct(String productId);
}
