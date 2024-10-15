import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/cache/Mycache.dart';
import 'package:learning_system/core/api/api_consumer.dart';
import 'package:learning_system/core/api/endpoints.dart';
import 'package:learning_system/core/errors/exceptions.dart';
import 'package:learning_system/core/models/sign_in_model.dart';
import 'package:learning_system/core/models/sign_up_model.dart';
import '../../models/profile_model.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final ApiConsumer api;
  UserCubit(this.api) : super(UserInitial());
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  GlobalKey<FormState> signInFormKey = GlobalKey();

  // sign up
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController repassword = TextEditingController();
  //sign in
  TextEditingController email1 = TextEditingController();
  TextEditingController password1 = TextEditingController();

  SignInModel? signInModel;
  SignUpModel? signUpModel;

  ProfileModel? user;

  signUp() async {
    try {
      emit(SignUpLoading());
      final response = await api.post(EndPoints.signUp, data: {
        ApiKeys.firstName: firstName.text,
        ApiKeys.lastName: lastName.text,
        ApiKeys.email: email.text,
        ApiKeys.phonenumber: phonenumber.text,
        ApiKeys.password: password.text,
        ApiKeys.repassword: repassword.text
      });
      emit(SignUpSuccess(message: response['message']));
    } on ServerException catch (e) {
      emit(SignUpFailure(errMessage: e.errorModel.message));
    }
  }

  signIn() async {
    try {
      emit(SignInLoading());
      final response = await api.post(EndPoints.signIn, data: {
        ApiKeys.email1: email1.text,
        ApiKeys.password1: password1.text,
      });
      MyCache().saveData(key: ApiKeys.token, value: response[ApiKeys.token]);
      emit(SignInSuccess(message: response['message']));
    } on ServerException catch (e) {
      emit(SignInFailure(errMessage: e.errorModel.message));
    }
  }

  logOut() async {
    try {
      final response = await api.get(EndPoints.logout);
      emit(LogoutSuccess(message: response['message']));
      MyCache().clearData(key: ApiKeys.token);
    } on ServerException catch (e) {
      emit(LogoutFailure(errMessage: e.errorModel.message));
    }
  }
}
