import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grovia/featuers/auth/domain/entities/user.dart';
import 'package:grovia/featuers/auth/domain/usecases/get-current-user-usecase.dart';
import 'package:grovia/featuers/auth/domain/usecases/signin-facebook-usecase.dart';
import 'package:grovia/featuers/auth/domain/usecases/signin-google-usecase.dart';
import 'package:grovia/featuers/auth/domain/usecases/signin-usecase.dart';
import 'package:grovia/featuers/auth/domain/usecases/signout-usecase.dart';
import 'package:grovia/featuers/auth/domain/usecases/signup-usecase.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final SignInUsecase signInUsecase;
  final GetCurrentUserUseCase getCurrentUserUseCase;
  final SignOutUseCase signOutUseCase;
  final SignUpUseCase signUpUseCase;
  final SignInWithFacebookUseCase signInWithFacebookUseCase;
  final SignInWithGoogleUseCase signInWithGoogleUseCase;

  AuthenticationCubit({
    required this.signInUsecase,
    required this.getCurrentUserUseCase,
    required this.signOutUseCase,
    required this.signUpUseCase,
    required this.signInWithFacebookUseCase,
    required this.signInWithGoogleUseCase,
  }) : super(AuthenticationInitial());

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
    required UserRole role,
    required String storeName,
  }) async {
    emit(AuthenticationLoading());

    final result = await signUpUseCase(
      email: email,
      password: password,
      name: name,
      phone: phone,
      role: role,
      storeName: storeName,
    );

    result.fold(
      (failure) => emit(AuthenticationError(message: failure.message)),
      (user) => emit(AuthenticationAuthenticated(user: user)),
    );
  }

  Future<void> signIn({required String email, required String password}) async {
    emit(AuthenticationLoading());

    final result = await signInUsecase(email: email, password: password);

    result.fold(
      (failure) => emit(AuthenticationError(message: failure.message)),
      (user) => emit(AuthenticationAuthenticated(user: user)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(AuthenticationLoading());

    final result = await signInWithGoogleUseCase();

    result.fold(
      (failure) => emit(AuthenticationError(message: failure.message)),
      (user) => emit(AuthenticationAuthenticated(user: user)),
    );
  }

  Future<void> signInWithFacebook() async {
    emit(AuthenticationLoading());

    final result = await signInWithFacebookUseCase();

    result.fold(
      (failure) => emit(AuthenticationError(message: failure.message)),
      (user) => emit(AuthenticationAuthenticated(user: user)),
    );
  }

  Future<void> signOut() async {
    emit(AuthenticationLoading());

    final result = await signOutUseCase();

    result.fold(
      (failure) => emit(AuthenticationError(message: failure.message)),
      (_) => emit(AuthenticationUnauthenticated()),
    );
  }

  Future<void> getCurrentUser() async {
    emit(AuthenticationLoading());

    final result = await getCurrentUserUseCase();

    result.fold(
      (failure) => emit(AuthenticationError(message: failure.message)),
      (user) => user != null
          ? emit(AuthenticationAuthenticated(user: user))
          : emit(AuthenticationUnauthenticated()),
    );
  }
}
