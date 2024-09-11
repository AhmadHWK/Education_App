part of 'getsubteacher_cubit.dart';

@immutable
sealed class GetsubteacherState {}

final class GetsubteacherInitial extends GetsubteacherState {}

final class GetsubteacherSuccess extends GetsubteacherState {
  final TeacherModel teacherModel;

  GetsubteacherSuccess({required this.teacherModel});
}

final class GetsubteacherLoading extends GetsubteacherState {}

final class GetsubteacherFailure extends GetsubteacherState {
  final String errMessage;

  GetsubteacherFailure({required this.errMessage});
}
