import 'package:dartz/dartz.dart';
import 'package:grovia/core/errors/errors.dart';
import 'package:grovia/featuers/auth/domain/entities/user.dart';

abstract class AuthRepo {
  Future<Either<Failure, User>> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
    required UserRole role,
    required String storeName,
  });

  Future<Either<Failure, User>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> signInWithGoogle();
  Future<Either<Failure, User>> signInWithFacebook();
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, User?>> getCurrentUser();
}
