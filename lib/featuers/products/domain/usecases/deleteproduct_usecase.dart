import 'package:dartz/dartz.dart';
import 'package:grovia/core/errors/errors.dart';
import 'package:grovia/featuers/products/domain/repositories/product_repo.dart';

class DeleteproductUsecase {
  final ProductRepo productRepo;

  const DeleteproductUsecase({required this.productRepo});

  Future<Either<Failure, void>> call(String productId) async {
    return await productRepo.deleteProduct(productId);
  }
}
