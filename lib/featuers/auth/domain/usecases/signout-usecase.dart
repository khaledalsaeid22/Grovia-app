import 'package:dartz/dartz.dart';
import 'package:grovia/core/errors/errors.dart';
import 'package:grovia/featuers/auth/domain/repositories/auth_repo.dart';

class SignOutUseCase {
  final AuthRepo authRepo;

  const SignOutUseCase({required this.authRepo});

  Future<Either<Failure, void>> call() async {
    return await authRepo.signOut();
  }
}
