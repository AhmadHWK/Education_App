part of 'getfiles_cubit.dart';

@immutable
sealed class GetfilesState {}

final class GetfilesInitial extends GetfilesState {}

final class GetfilesSuccess extends GetfilesState {
  final FilesModel filesModel;

  GetfilesSuccess({required this.filesModel});
}

final class GetfilesLoading extends GetfilesState {}

final class GetfilesFailure extends GetfilesState {
  final String errMessage;

  GetfilesFailure({required this.errMessage});
}
