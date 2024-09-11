class ExamModel {
  final Data data;
  ExamModel({
    required this.data,
  });
  factory ExamModel.fromJson(Map<String, dynamic> json) {
    return ExamModel(data: Data.fromJson(json['data']));
  }
}

class Data {
  final int id;
  final int subjectId;
  final int questionsNumber;
  final int examTime;
  final int successDegree;
  final List<Question> questions;
  Data({
    required this.id,
    required this.subjectId,
    required this.questionsNumber,
    required this.examTime,
    required this.successDegree,
    required this.questions,
  });
  factory Data.fromJson(Map<String, dynamic> json) {
    var questionsJson = json['questions'] as List;
    List<Question> questionsList =
        questionsJson.map((q) => Question.fromJson(q)).toList();
    return Data(
      id: json['id'],
      subjectId: json['subject_id'],
      questionsNumber: json['questions_number'],
      examTime: json['exam_time'],
      successDegree: json['success_degree'],
      questions: questionsList,
    );
  }
}

class Question {
  final int id;
  final int examId;
  final String questionText;
  final List<Option> options;
  Question({
    required this.id,
    required this.examId,
    required this.questionText,
    required this.options,
  });
  factory Question.fromJson(Map<String, dynamic> json) {
    var optionsJson = json['options'] as List;
    List<Option> optionsList =
        optionsJson.map((o) => Option.fromJson(o)).toList();
    return Question(
      id: json['id'],
      examId: json['exam_id'],
      questionText: json['question_text'],
      options: optionsList,
    );
  }
}

class Option {
  final int id;
  final int questionId;
  final String optionText;
  Option({
    required this.id,
    required this.questionId,
    required this.optionText,
  });
  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      id: json['id'],
      questionId: json['question_id'],
      optionText: json['option_text'],
    );
  }
}
