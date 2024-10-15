part of 'saved_cubit.dart';

@immutable
sealed class SavedState {}

final class SavedInitial extends SavedState {}

//
final class GetSuccess extends SavedState {
  final List<Favorite> favorites;

  GetSuccess({required this.favorites});
}

final class GetLoading extends SavedState {}

final class GetFailure extends SavedState {
  final String message;

  GetFailure({required this.message});
}

//
final class PostSuccess extends SavedState {
  final String message;

  PostSuccess({required this.message});
}

final class PostLoading extends SavedState {}

final class PostFailure extends SavedState {
  final String message;

  PostFailure({required this.message});
}

//
final class DelSuccess extends SavedState {
  final String message;

  DelSuccess({required this.message});
}

final class DelLoading extends SavedState {}

final class DelFailure extends SavedState {
  final String errMessage;

  DelFailure({required this.errMessage});
}
