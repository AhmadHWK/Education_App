import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:learning_system/core/api/api_consumer.dart';
import 'package:learning_system/core/models/submit_model.dart';
import 'package:meta/meta.dart';

import '../../api/endpoints.dart';

part 'submit_result_state.dart';

class SubmitResultCubit extends Cubit<SubmitResultState> {
  ApiConsumer api;
  SubmitResultCubit(this.api) : super(SubmitResultInitial());
  submitResult(id, Map<int, int> selectedOptions) async {
    List<Map<String, dynamic>> answers = selectedOptions.entries.map((entry) {
      return {
        "question_id": entry.key,
        "selected_option_id": entry.value,
      };
    }).toList();

    Object jsonAnswers = jsonEncode({"answers": answers});
    try {
      emit(SubmitResultLoading());
      final response =
          await api.post(EndPoints.submitResult(id), data: jsonAnswers);
      final result = SubmitModel.fromJson(response);
      emit(SubmitResultSuccess(submitModel: result));
    } on Exception catch (e) {
      emit(SubmitResultFailure());
    }
  }
}
