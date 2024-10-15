part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

//sign up
final class SignUpSuccess extends UserState {
  final String message;

  SignUpSuccess({required this.message});
}

final class SignUpLoading extends UserState {}

final class SignUpFailure extends UserState {
  final String errMessage;

  SignUpFailure({required this.errMessage});
}

//sign in
final class SignInSuccess extends UserState {
  final String message;

  SignInSuccess({required this.message});
}

final class SignInLoading extends UserState {}

final class SignInFailure extends UserState {
  final String errMessage;

  SignInFailure({required this.errMessage});
}

//log out
final class LogoutSuccess extends UserState {
  final String message;

  LogoutSuccess({required this.message});
}

final class LogoutFailure extends UserState {
  final String errMessage;

  LogoutFailure({required this.errMessage});
}
