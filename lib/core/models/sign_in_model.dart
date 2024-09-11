import 'package:learning_system/core/api/endpoints.dart';

class SignInModel {
  final String status;
  final String message;
  final String token;

  SignInModel(
      {required this.status, required this.message, required this.token});
  factory SignInModel.fromjson(Map<String, dynamic> jsonData) {
    return SignInModel(
        message: jsonData[ApiKeys.doneMessage],
        token: jsonData[ApiKeys.token],
        status: jsonData[ApiKeys.status]);
  }
}
