import 'package:dartz/dartz.dart';
import 'package:grovia/core/errors/errors.dart';
import 'package:grovia/featuers/auth/domain/entities/user.dart';
import 'package:grovia/featuers/auth/domain/repositories/auth_repo.dart';

class SignInWithFacebookUseCase {
  final AuthRepo authRepo;

  const SignInWithFacebookUseCase({required this.authRepo});

  Future<Either<Failure, User>> call() async {
    return await authRepo.signInWithFacebook();
  }
}
