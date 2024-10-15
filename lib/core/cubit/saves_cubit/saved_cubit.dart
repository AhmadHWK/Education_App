import 'package:bloc/bloc.dart';
import 'package:learning_system/core/api/api_consumer.dart';
import 'package:meta/meta.dart';

import '../../api/endpoints.dart';
import '../../models/saves_model.dart';

part 'saved_state.dart';

class SavedCubit extends Cubit<SavedState> {
  ApiConsumer api;
  SavedCubit(this.api) : super(SavedInitial());

  getSaves() async {
    try {
      emit(GetLoading());
      final response = await api.get(EndPoints.getsaves);
      List<Favorite> jsonData = response;
      jsonData
          .map((item) => Favorite.fromJson(item as Map<String, dynamic>))
          .toList();
      emit(GetSuccess(favorites: jsonData));
    } on Exception catch (e) {
      emit(GetFailure(message: e.toString()));
    }
  }

  postSaves(id, type) async {
    try {
      emit(PostLoading());
      final response = await api.post(EndPoints.postsaves,
          data: {'favoritable_id': id, 'favoritable_type': type});
      emit(PostSuccess(message: response['message']));
    } on Exception catch (e) {
      emit(PostFailure(message: e.toString()));
    }
  }

  deleteSaves(id) async {
    try {
      emit(DelLoading());
      final response = await api.delete(EndPoints.delsaves(id));
      emit(DelSuccess(message: response['message']));
    } on Exception catch (e) {
      emit(DelFailure(errMessage: e.toString()));
    }
  }
}
