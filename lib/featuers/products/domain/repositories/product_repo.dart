import 'package:dartz/dartz.dart';
import 'package:grovia/core/errors/errors.dart';
import 'package:grovia/featuers/products/domain/entities/product.dart';
import 'package:grovia/featuers/products/domain/usecases/params/add_product_params.dart';
import 'package:grovia/featuers/products/domain/usecases/params/update_product_params.dart';

abstract class ProductRepo {
  Future<Either<Failure, Product>> addProduct(AddProductParams params);
  Future<Either<Failure, Product>> updateProduct(UpdateProductParams params);
  Future<Either<Failure, List<Product>>> getProducts(String merchantId);
  Future<Either<Failure, void>> deleteProduct(String productId);
}
