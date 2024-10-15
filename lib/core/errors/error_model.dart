import 'package:learning_system/core/api/endpoints.dart';

class ErrorModel {
  final int status;
  final String message;

  ErrorModel({required this.status, required this.message});

  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      status: jsonData[ApiKeys.status],
      message: jsonData[ApiKeys.errormessage],
    );
  }
}
