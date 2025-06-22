import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grovia/app.dart';
import 'package:grovia/featuers/auth/data/datasources/firebase-auth-datasource.dart';
import 'package:grovia/featuers/auth/data/repositories/auth-repo-impl.dart';
import 'package:grovia/featuers/auth/domain/usecases/get-current-user-usecase.dart';
import 'package:grovia/featuers/auth/domain/usecases/signin-facebook-usecase.dart';
import 'package:grovia/featuers/auth/domain/usecases/signin-google-usecase.dart';
import 'package:grovia/featuers/auth/domain/usecases/signin-usecase.dart';
import 'package:grovia/featuers/auth/domain/usecases/signout-usecase.dart';
import 'package:grovia/featuers/auth/domain/usecases/signup-usecase.dart';
import 'package:grovia/featuers/auth/presentation/cubit/authentication_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FacebookAuth facebookAuth = FacebookAuth.instance;

  // Initialisation للـ DataSource
  final FirebaseAuthDatasource firebaseAuthDatasource =
      FirebaseAuthDatasourceImpl(
        firebaseAuth,
        firestore,
        googleSignIn,
        facebookAuth,
      );

  // Initialisation للـ Repository
  final AuthRepoImpl authRepository = AuthRepoImpl(
    datasource: firebaseAuthDatasource,
  );

  // Initialisation للـ Use Cases
  final SignInUsecase signInUsecase = SignInUsecase(authRepo: authRepository);
  final SignUpUseCase signUpUseCase = SignUpUseCase(authRepo: authRepository);
  final SignInWithGoogleUseCase signInWithGoogleUseCase =
      SignInWithGoogleUseCase(authRepo: authRepository);
  final SignInWithFacebookUseCase signInWithFacebookUseCase =
      SignInWithFacebookUseCase(authRepo: authRepository);
  final SignOutUseCase signOutUseCase = SignOutUseCase(
    authRepo: authRepository,
  );
  final GetCurrentUserUseCase getCurrentUserUseCase = GetCurrentUserUseCase(
    authRepo: authRepository,
  );

  runApp(
    BlocProvider(
      create: (context) => AuthenticationCubit(
        signInUsecase: signInUsecase,
        getCurrentUserUseCase: getCurrentUserUseCase,
        signOutUseCase: signOutUseCase,
        signUpUseCase: signUpUseCase,
        signInWithFacebookUseCase: signInWithFacebookUseCase,
        signInWithGoogleUseCase: signInWithGoogleUseCase,
      )..getCurrentUser(),
      child: MyApp(),
    ),
  );
}
