import 'package:learning_system/core/api/endpoints.dart';

class SignUpModel {
  final String message;
  final String status;
  SignUpModel({required this.status, required this.message});
  factory SignUpModel.fromjson(Map<String, dynamic> jsonData) {
    return SignUpModel(
        status: jsonData[ApiKeys.status],
        message: jsonData[ApiKeys.doneMessage]);
  }
}
