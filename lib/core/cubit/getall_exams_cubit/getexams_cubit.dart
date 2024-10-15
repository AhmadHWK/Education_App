import 'package:bloc/bloc.dart';
import 'package:learning_system/core/models/allexams_model.dart';
import 'package:meta/meta.dart';

import '../../api/api_consumer.dart';
import '../../api/endpoints.dart';

part 'getexams_state.dart';

class GetAllExamsCubit extends Cubit<GetExamsState> {
  ApiConsumer api;
  GetAllExamsCubit(this.api) : super(GetExamsInitial());

  getSubExams(int id) async {
    try {
      emit(GetExamstLoading());
      final response = await api.get(EndPoints.getExamsEndPoint(id));
      final exams = ExamsListModel.fromJson(response);

      emit(GetExamsSuccess(examsListModel: exams));
    } on Exception catch (e) {
      emit(GetExamsFailure(errMessage: e.toString()));
    }
  }
}
