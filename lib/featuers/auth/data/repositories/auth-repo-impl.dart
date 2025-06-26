import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:grovia/core/errors/errors.dart';
import 'package:grovia/featuers/auth/data/datasources/firebase-auth-datasource.dart';
import 'package:grovia/featuers/auth/data/models/user-model.dart';
import 'package:grovia/featuers/auth/domain/entities/user.dart';
import 'package:grovia/featuers/auth/domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthDatasource datasource;

  AuthRepoImpl({required this.datasource});

  @override
  Future<Either<Failure, User?>> getCurrentUser() async {
    try {
      final firebaseUser = datasource.getCurrentFirebaseUser();
      if (firebaseUser != null) {
        final userDoc = await datasource.firestore
            .collection('users')
            .doc(firebaseUser.uid)
            .get();
        if (userDoc.exists) {
          final userModel = UserModel.fromFirestore(userDoc);
          return Right(userModel.toEntity());
        } else {
          return const Left(
            AuthFailure('User data not found in Firestore for current user.'),
          );
        }
      } else {
        return Right(null);
      }
    } on auth.FirebaseAuthException catch (e) {
      return Left(
        AuthFailure(
          e.message ??
              'An authentication error occurred when getting current user.',
        ),
      );
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await datasource.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final firbaseUser = userCredential.user;

      if (firbaseUser != null) {
        final userdoc = await datasource.firestore
            .collection('users')
            .doc(firbaseUser.uid)
            .get();

        if (userdoc.exists) {
          final userModel = UserModel.fromFirestore(userdoc);
          return Right(userModel.toEntity());
        } else {
          return const Left(
            AuthFailure(
              'User data not found in Firestore after successful sign-in.',
            ),
          );
        }
      } else {
        return const Left(
          AuthFailure('Sign-in failed: No Firebase user data.'),
        );
      }
    } on auth.FirebaseAuthException catch (e) {
      return Left(AuthFailure(e.message ?? 'An error occurred during sign-in'));
    } on Exception catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signInWithFacebook() async {
    try {
      final userCredential = await datasource.signInWithFacebook();
      final firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        final userDoc = await datasource.firestore
            .collection('users')
            .doc(firebaseUser.uid)
            .get();

        if (userDoc.exists) {
          final userModel = UserModel.fromFirestore(userDoc);
          return Right(userModel.toEntity());
        } else {
          final userModel = UserModel.fromFirebaseUser(firebaseUser);
          return Right(userModel.toEntity());
        }
      } else {
        return const Left(
          AuthFailure('Facebook sign-in failed: No Firebase user data.'),
        );
      }
    } on auth.FirebaseAuthException catch (e) {
      return Left(
        AuthFailure(
          e.message ??
              'An authentication error occurred during Facebook sign-in.',
        ),
      );
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await datasource.signOut();

      return const Right(null);
    } on auth.FirebaseAuthException catch (e) {
      return Left(
        AuthFailure(
          e.message ?? 'An authentication error occurred during sign-out.',
        ),
      );
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signInWithGoogle() async {
    try {
      final userCredential = await datasource.signInWithGoogle();
      final firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        final userDoc = await datasource.firestore
            .collection('users')
            .doc(firebaseUser.uid)
            .get();

        if (userDoc.exists) {
          final userModel = UserModel.fromFirestore(userDoc);
          return Right(userModel.toEntity());
        } else {
          final userModel = UserModel.fromFirebaseUser(firebaseUser);
          return Right(userModel.toEntity());
        }
      } else {
        return const Left(
          AuthFailure('Google sign-in failed: No Firebase user data.'),
        );
      }
    } on auth.FirebaseAuthException catch (e) {
      return Left(
        AuthFailure(
          e.message ??
              'An authentication error occurred during Google sign-in.',
        ),
      );
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
    required UserRole role,
    required String storeName,
  }) async {
    try {
      final userCredential = await datasource.signUp(
        email: email,
        password: password,
        name: name,
        phone: phone,
        role: role,
        storeName: storeName,
      );

      final firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        final userModel = UserModel.fromFirebaseUser(firebaseUser);
        return Right(userModel.toEntity());
      } else {
        return Left(AuthFailure('User not found'));
      }
    } on auth.FirebaseAuthException catch (e) {
      return Left(AuthFailure(e.message ?? 'An error occurred during sign up'));
    } on Exception catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }
}
