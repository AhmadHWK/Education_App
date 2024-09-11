part of 'getphotos_cubit.dart';

@immutable
sealed class GetphotosState {}

final class GetphotosInitial extends GetphotosState {}

final class GetPhotoSuccess extends GetphotosState {
  final PhotoModel photoModel;

  GetPhotoSuccess({required this.photoModel});
}

final class GetPhotoLoading extends GetphotosState {}

final class GetPhotoFailure extends GetphotosState {
  final String errMessage;

  GetPhotoFailure({required this.errMessage});
}
