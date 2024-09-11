part of 'getexams_cubit.dart';

@immutable
sealed class GetExamsState {}

final class GetExamsInitial extends GetExamsState {}

final class GetExamsSuccess extends GetExamsState {
  final ExamsListModel examsListModel;

  GetExamsSuccess({required this.examsListModel});
}

final class GetExamstLoading extends GetExamsState {}

final class GetExamsFailure extends GetExamsState {
  final String errMessage;

  GetExamsFailure({required this.errMessage});
}
