part of 'get_exam_cubit.dart';

@immutable
sealed class GetExamState {}

final class GetExamInitial extends GetExamState {}

final class GetExamSuccess extends GetExamState {
  final ExamModel examModel;

  GetExamSuccess({required this.examModel});
}

final class GetExamLoading extends GetExamState {}

final class GetExamFailure extends GetExamState {
  final String errmessage;

  GetExamFailure({required this.errmessage});
}
