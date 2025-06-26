import 'package:dartz/dartz.dart';
import 'package:grovia/core/errors/errors.dart';
import 'package:grovia/featuers/products/domain/entities/product.dart';
import 'package:grovia/featuers/products/domain/repositories/product_repo.dart';
import 'package:grovia/featuers/products/domain/usecases/params/update_product_params.dart';

class UpdatePRoductUseCase {
  final ProductRepo productRepo;

  UpdatePRoductUseCase({required this.productRepo});

  Future<Either<Failure, Product>> call(UpdateProductParams params) async {
    return await productRepo.updateProduct(params);
  }
}
