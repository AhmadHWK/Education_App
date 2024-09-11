import 'package:bloc/bloc.dart';
import 'package:learning_system/core/models/exam_model.dart';
import 'package:meta/meta.dart';

import '../../api/api_consumer.dart';
import '../../api/endpoints.dart';

part 'get_exam_state.dart';

class GetExamCubit extends Cubit<GetExamState> {
  GetExamCubit(this.api) : super(GetExamInitial());
  ApiConsumer api;

  getExam(int id) async {
    try {
      emit(GetExamLoading());
      final response = await api.get(EndPoints.getExamTemplateEndPoint(id));
      final exam = ExamModel.fromJson(response);
      emit(GetExamSuccess(examModel: exam));
    } on Exception catch (e) {
      emit(GetExamFailure(errmessage: e.toString()));
    }
  }
}
