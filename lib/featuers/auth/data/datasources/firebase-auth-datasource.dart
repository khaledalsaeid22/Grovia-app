import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grovia/featuers/auth/domain/entities/user.dart';

abstract class FirebaseAuthDatasource {
  final FirebaseFirestore firestore;

  FirebaseAuthDatasource(this.firestore);
  Future<auth.UserCredential> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
    required UserRole role,
    required String storeName,
  });

  Future<auth.UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<auth.UserCredential> signInWithGoogle();
  Future<auth.UserCredential> signInWithFacebook();
  Future<void> signOut();

  auth.User? getCurrentFirebaseUser();
  Future<void> sendEmailVerification();
}

class FirebaseAuthDatasourceImpl implements FirebaseAuthDatasource {
  final auth.FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  final GoogleSignIn googleSignIn;
  final FacebookAuth facebookAuth;

  FirebaseAuthDatasourceImpl(
    this.firebaseAuth,
    this.firestore,
    this.googleSignIn,
    this.facebookAuth,
  );

  @override
  auth.User? getCurrentFirebaseUser() {
    return firebaseAuth.currentUser;
  }

  @override
  Future<void> sendEmailVerification() async {
    try {
      if (firebaseAuth.currentUser != null) {
        await firebaseAuth.currentUser!.sendEmailVerification();
      } else {
        throw Exception('No user is currently signed in');
      }
    } on auth.FirebaseAuthException catch (e) {
      throw e;
    } catch (e) {
      throw Exception('An error occurred while sending email verification: $e');
    }
  }

  @override
  Future<auth.UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on auth.FirebaseAuthException catch (e) {
      throw e;
    } catch (e) {
      throw Exception('An error occurred during sign-in: $e');
    }
  }

  @override
  Future<auth.UserCredential> signInWithFacebook() async {
    try {
      final LoginResult result = await facebookAuth.login();
      if (result.status == LoginStatus.cancelled) {
        throw Exception('Facebook sign-in aborted by user');
      } else if (result.status == LoginStatus.failed) {
        throw Exception('Facebook sign-in failed: ${result.message}');
      }

      if (result.accessToken == null) {
        throw Exception('Facebook access token is null.');
      }

      final auth.AuthCredential credential =
          auth.FacebookAuthProvider.credential(result.accessToken!.tokenString);

      final userCredential = await firebaseAuth.signInWithCredential(
        credential,
      );

      final userDocRef = firestore
          .collection('users')
          .doc(userCredential.user!.uid);
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) {
        await userDocRef.set({
          'id': userCredential.user!.uid,
          'email': userCredential.user!.email,
          'name': userCredential.user!.displayName ?? 'No Name',
          'phone': userCredential.user!.phoneNumber ?? 'No Phone',
          'photoUrl': userCredential.user!.photoURL ?? '',
          'role': UserRole.customer.toString().split('.').last,
          'createdAt': FieldValue.serverTimestamp(),
        });
      }

      return userCredential;
    } on auth.FirebaseAuthException catch (e) {
      rethrow; // بنرمي الـ FirebaseAuthException
    } catch (e) {
      // لأي Exception تانية (زي مشاكل في SDK فيسبوك)
      throw Exception('An error occurred during Facebook sign-in: $e');
    }
  }

  @override
  Future<auth.UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        throw Exception('Google sign-in aborted by user');
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final auth.AuthCredential credential = auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await firebaseAuth.signInWithCredential(
        credential,
      );

      final userDocRef = firestore
          .collection('users')
          .doc(userCredential.user!.uid);
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) {
        await userDocRef.set({
          'id': userCredential.user!.uid,
          'email': userCredential.user!.email,
          'name': userCredential.user!.displayName ?? 'No Name',
          'phone': userCredential.user!.phoneNumber ?? 'No Phone',
          'photoUrl': userCredential.user!.photoURL ?? '',
          'role': UserRole.customer.toString().split('.').last,
          'createdAt': FieldValue.serverTimestamp(),
        });
      }
      return userCredential;
    } on auth.FirebaseAuthException catch (e) {
      rethrow;
    } catch (e) {
      throw Exception('An error occurred during Google sign-in: $e');
    }
  }

  @override
  Future<void> signOut() {
    return firebaseAuth.signOut();
  }

  @override
  Future<auth.UserCredential> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
    required UserRole role,
    required String storeName,
  }) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        await firestore.collection('users').doc(userCredential.user!.uid).set({
          'name': name,
          'email': email,
          'phone': phone,
          'role': role.toString().split('.').last,
          'createdAt': FieldValue.serverTimestamp(),
          'storeName': storeName,
        });
        await userCredential.user!.sendEmailVerification();
        return userCredential;
      } else {
        throw Exception('User registration failed');
      }
    } on auth.FirebaseAuthException catch (e) {
      // ignore: use_rethrow_when_possible
      throw e;
    } catch (e) {
      throw Exception('An error occurred during user registration: $e');
    }
  }
}
