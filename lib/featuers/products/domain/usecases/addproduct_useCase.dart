import 'package:dartz/dartz.dart';
import 'package:grovia/core/errors/errors.dart';
import 'package:grovia/featuers/products/domain/entities/product.dart';
import 'package:grovia/featuers/products/domain/repositories/product_repo.dart';
import 'package:grovia/featuers/products/domain/usecases/params/add_product_params.dart';

class AddProductUseCase {
  final ProductRepo productRepo;

  AddProductUseCase({required this.productRepo});

  Future<Either<Failure, Product>> call(AddProductParams params) async {
    return await productRepo.addProduct(params);
  }
}
