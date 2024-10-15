import 'package:bloc/bloc.dart';
import 'package:learning_system/core/api/api_consumer.dart';
import 'package:learning_system/core/models/books_model.dart';
import 'package:meta/meta.dart';

import '../../api/endpoints.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  ApiConsumer api;
  BooksCubit(this.api) : super(BooksInitial());
  getSubBooks(int id) async {
    try {
      emit(GetBooksLoading());
      final response = await api.get(EndPoints.getBooksEndPoint(id));
      final books = BooksModel.fromJson(response);
      emit(GetBooksSuccess(booksModel: books));
    } on Exception catch (e) {
      emit(GetBooksFailure(errmessage: e.toString()));
    }
  }
}
