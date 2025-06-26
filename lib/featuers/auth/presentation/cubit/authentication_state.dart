part of 'authentication_cubit.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationLoading extends AuthenticationState {}

final class AuthenticationAuthenticated extends AuthenticationState {
  final User user;

  AuthenticationAuthenticated({required this.user});

  @override
  List<Object> get props => [user];
}

final class AuthenticationUnauthenticated extends AuthenticationState {}

final class AuthenticationError extends AuthenticationState {
  final String message;

  const AuthenticationError({required this.message});

  @override
  List<Object> get props => [message];
}
