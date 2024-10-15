import 'package:bloc/bloc.dart';
import 'package:learning_system/core/api/api_consumer.dart';
import 'package:learning_system/core/models/files_model.dart';
import 'package:meta/meta.dart';

import '../../api/endpoints.dart';

part 'getfiles_state.dart';

class GetfilesCubit extends Cubit<GetfilesState> {
  ApiConsumer api;
  GetfilesCubit(this.api) : super(GetfilesInitial());

  getSubFiles(int id) async {
    try {
      emit(GetfilesLoading());
      final response = await api.get(EndPoints.getFilesEndPoint(id));
      final files = FilesModel.fromJson(response);
      emit(GetfilesSuccess(filesModel: files));
    } on Exception catch (e) {
      emit(GetfilesFailure(errMessage: e.toString()));
    }
  }
}
