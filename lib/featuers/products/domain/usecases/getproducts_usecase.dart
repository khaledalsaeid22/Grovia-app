import 'package:dartz/dartz.dart';
import 'package:grovia/core/errors/errors.dart';
import 'package:grovia/featuers/products/domain/entities/product.dart';
import 'package:grovia/featuers/products/domain/repositories/product_repo.dart';

class GetproductsUseCase {
  final ProductRepo productRepo;
  const GetproductsUseCase({required this.productRepo});

  Future<Either<Failure, List<Product>>> call(String merchantId) async {
    return await productRepo.getProducts(merchantId);
  }
}
