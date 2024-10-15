import 'package:bloc/bloc.dart';
import 'package:learning_system/core/api/api_consumer.dart';
import 'package:learning_system/core/api/endpoints.dart';
import 'package:learning_system/core/models/video_model.dart';
import 'package:meta/meta.dart';

part 'subvideos_state.dart';

class SubvideosCubit extends Cubit<SubvideosState> {
  ApiConsumer api;
  SubvideosCubit(this.api) : super(SubvideosInitial());
  getSubVideos(int id) async {
    try {
      emit(SubVideosLoading());
      final response = await api.get(EndPoints.getSubVideosEndPoint(id));
      final videos = VideoModel.fromjson(response);
      print(videos.message);
      emit(SubVideosSuccess(subVideos: videos));
    } on Exception catch (e) {
      emit(SubVideosFailure(message: e.toString()));
    }
  }
}
