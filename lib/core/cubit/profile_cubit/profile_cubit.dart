import 'package:flutter/widgets.dart';
import 'package:learning_system/core/api/api_consumer.dart';
import 'package:learning_system/core/api/endpoints.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.api) : super(ProfileInitial());
  final ApiConsumer api;
  getProfile() async {
    try {
      emit(GetProfileLoading());
      final response = await api.get(EndPoints.getprofile);
      print(response['data']);
      //final user = ProfileModel.fromjson(response);
      emit(GetProfileSuccess(
          email: response['data']['email'],
          fName: response['data']['first_name'],
          lName: response['data']['last_name'],
          phnum: response['data']['phone_no']));
    } catch (e) {
      emit(GetProfileFailure(errmessage: e.toString()));
    }
  }
}
