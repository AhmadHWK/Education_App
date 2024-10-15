part of 'books_cubit.dart';

@immutable
sealed class BooksState {}

final class BooksInitial extends BooksState {}

final class GetBooksSuccess extends BooksState {
  final BooksModel booksModel;

  GetBooksSuccess({required this.booksModel});
}

final class GetBooksLoading extends BooksState {}

final class GetBooksFailure extends BooksState {
  final String errmessage;

  GetBooksFailure({required this.errmessage});
}
