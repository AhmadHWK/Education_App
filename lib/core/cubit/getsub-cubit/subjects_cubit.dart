import 'package:flutter/material.dart';
import 'package:learning_system/core/api/api_consumer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/core/api/endpoints.dart';
import 'package:learning_system/core/errors/exceptions.dart';
import 'package:learning_system/core/models/subject.dart';

part 'subjects_state.dart';

class SubjectsCubit extends Cubit<SubjectsState> {
  SubjectsCubit(this.api) : super(SubjectsInitial());
  final ApiConsumer api;
  getSubject() async {
    try {
      emit(GetSubjectLoading());
      final response = await api.get(EndPoints.getSubject);
      final subjects = AllSubject.fromJson(response);

      emit(
        GetSubjectSuccess(subjects: subjects),
      );
    } on ServerException catch (e) {
      emit(
        GetSubjectFailure(errMessage: e.errorModel.message),
      );
    }
  }
}
