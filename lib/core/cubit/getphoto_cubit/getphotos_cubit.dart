import 'package:bloc/bloc.dart';
import 'package:learning_system/core/models/photo_model.dart';
import 'package:meta/meta.dart';

import '../../api/api_consumer.dart';
import '../../api/endpoints.dart';

part 'getphotos_state.dart';

class GetphotosCubit extends Cubit<GetphotosState> {
  ApiConsumer api;

  GetphotosCubit(this.api) : super(GetphotosInitial());

  getSubPhoto(int id) async {
    try {
      emit(GetPhotoLoading());
      final response = await api.get(EndPoints.getSubPhotoEndPoint(id));
      final photos = PhotoModel.fromjson(response);
      emit(GetPhotoSuccess(photoModel: photos));
    } on Exception catch (e) {
      emit(GetPhotoFailure(errMessage: e.toString()));
    }
  }
}
