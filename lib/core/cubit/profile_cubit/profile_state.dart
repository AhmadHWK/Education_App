part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

//get profile
final class GetProfileSuccess extends ProfileState {
  final String fName;
  final String lName;
  final String email;
  final String phnum;

  GetProfileSuccess(
      {required this.fName,
      required this.lName,
      required this.email,
      required this.phnum});
}

final class GetProfileLoading extends ProfileState {}

final class GetProfileFailure extends ProfileState {
  final String errmessage;

  GetProfileFailure({required this.errmessage});
}
