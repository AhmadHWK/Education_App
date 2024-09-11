part of 'subjects_cubit.dart';

@immutable
sealed class SubjectsState {}

final class SubjectsInitial extends SubjectsState {}

//get subject
final class GetSubjectSuccess extends SubjectsState {
  final AllSubject subjects;

  GetSubjectSuccess({required this.subjects});
}

final class GetSubjectLoading extends SubjectsState {}

final class GetSubjectFailure extends SubjectsState {
  final String errMessage;

  GetSubjectFailure({required this.errMessage});
}
