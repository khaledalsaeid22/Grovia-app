import 'package:dartz/dartz.dart';
import 'package:grovia/core/errors/errors.dart';
import 'package:grovia/featuers/auth/domain/entities/user.dart';
import 'package:grovia/featuers/auth/domain/repositories/auth_repo.dart';

class SignInUsecase {
  final AuthRepo authRepo;

  SignInUsecase({required this.authRepo});

  Future<Either<Failure, User>> call({
    required String email,
    required String password,
  }) async {
    return await authRepo.signIn(email: email, password: password);
  }
}
