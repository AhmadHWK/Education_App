class SubmitModel {
  final bool status;
  final int score;
  final int totalQuestions;
  final int degree;
  final bool passed;
  SubmitModel({
    required this.status,
    required this.score,
    required this.totalQuestions,
    required this.degree,
    required this.passed,
  });
  factory SubmitModel.fromJson(Map<String, dynamic> Json) {
    return SubmitModel(
      status: Json['status'],
      score: Json['score'],
      totalQuestions: Json['total_questions'],
      degree: Json['degree'],
      passed: Json['passed'],
    );
  }
}
