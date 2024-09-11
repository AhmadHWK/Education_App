import 'package:bloc/bloc.dart';
import 'package:learning_system/core/api/api_consumer.dart';
import 'package:learning_system/core/models/teacher.dart';
import 'package:meta/meta.dart';

import '../../api/endpoints.dart';

part 'getsubteacher_state.dart';

class GetsubteacherCubit extends Cubit<GetsubteacherState> {
  ApiConsumer api;
  GetsubteacherCubit(this.api) : super(GetsubteacherInitial());

  getSubTeachers(int id) async {
    try {
      emit(GetsubteacherLoading());
      final response = await api.get(EndPoints.getSubTeacher(id));
      final teacher = TeacherModel.fromJson(response);
      emit(GetsubteacherSuccess(teacherModel: teacher));
    } on Exception catch (e) {
      emit(GetsubteacherFailure(errMessage: e.toString()));
    }
  }
}
