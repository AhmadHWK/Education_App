part of 'submit_result_cubit.dart';

@immutable
sealed class SubmitResultState {}

final class SubmitResultInitial extends SubmitResultState {}

final class SubmitResultSuccess extends SubmitResultState {
  final SubmitModel submitModel;

  SubmitResultSuccess({required this.submitModel});
}

final class SubmitResultLoading extends SubmitResultState {}

final class SubmitResultFailure extends SubmitResultState {}
