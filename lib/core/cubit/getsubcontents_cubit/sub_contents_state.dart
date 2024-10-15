part of 'sub_contents_cubit.dart';

@immutable
sealed class SubContentsState {}

final class SubContentsInitial extends SubContentsState {}

//get subject contents
final class GetSubContentsSuccess extends SubContentsState {
  final SubContents subContents;

  GetSubContentsSuccess({required this.subContents});
}

final class GetSubContentsLoading extends SubContentsState {}

final class GetSubContentsFailure extends SubContentsState {
  final String errMessage;

  GetSubContentsFailure({required this.errMessage});
}
