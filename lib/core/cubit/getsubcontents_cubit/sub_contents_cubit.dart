import 'package:learning_system/core/api/api_consumer.dart';
import 'package:learning_system/core/api/endpoints.dart';
import 'package:learning_system/core/models/subject_content.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'sub_contents_state.dart';

class SubContentsCubit extends Cubit<SubContentsState> {
  final ApiConsumer api;

  SubContentsCubit(this.api) : super(SubContentsInitial());
  getSubContents(int id) async {
    try {
      emit(GetSubContentsLoading());
      final response = await api.get(EndPoints.getSubContentsEndPoint(id));
      print(response);
      final subContents = SubContents.fromJson(response);
      emit(GetSubContentsSuccess(subContents: subContents));
    } on Exception catch (e) {
      emit(GetSubContentsFailure(errMessage: e.toString()));
    }
  }
}
