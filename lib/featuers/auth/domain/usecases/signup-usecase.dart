import 'package:dartz/dartz.dart';
import 'package:grovia/core/errors/errors.dart';
import 'package:grovia/featuers/auth/domain/entities/user.dart';
import 'package:grovia/featuers/auth/domain/repositories/auth_repo.dart';

class SignUpUseCase {
  final AuthRepo authRepo;

  const SignUpUseCase({required this.authRepo});

  Future<Either<Failure, User>> call({
    required String email,
    required String password,
    required String name,
    required String phone,
    required UserRole role,
    required String storeName,
  }) async {
    return await authRepo.signUp(
      email: email,
      password: password,
      name: name,
      phone: phone,
      role: role,
      storeName: storeName,
    );
  }
}
