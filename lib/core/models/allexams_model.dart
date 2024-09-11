class ExamsListModel {
  final bool status;
  final String message;
  final List<SubExamsList> data;

  ExamsListModel(
      {required this.status, required this.message, required this.data});

  factory ExamsListModel.fromJson(Map<String, dynamic> json) {
    var examsListJson = json['data'] as List;
    List<SubExamsList> examsList =
        examsListJson.map((exam) => SubExamsList.fromJson(exam)).toList();
    return ExamsListModel(
      status: json['status'],
      message: json['message'],
      data: examsList,
    );
  }
}

class SubExamsList {
  final int id;
  final int subjectId;
  final String examName;
  final int examTime;
  final int qestionsNumber;
  final int successDegree;
  final String examDayStartPoint;
  final String examDayEndPoint;
  final int createdBy;
  final Null updatedBy;
  final String createdAt;
  final String updatedAt;

  SubExamsList(
      {required this.id,
      required this.subjectId,
      required this.examName,
      required this.examTime,
      required this.qestionsNumber,
      required this.successDegree,
      required this.examDayStartPoint,
      required this.examDayEndPoint,
      required this.createdBy,
      required this.updatedBy,
      required this.createdAt,
      required this.updatedAt});

  factory SubExamsList.fromJson(Map<String, dynamic> json) {
    return SubExamsList(
      id: json['id'],
      subjectId: json['subject_id'],
      examName: json['Exam_Name'],
      examTime: json['exam_time'],
      qestionsNumber: json['qestions_number'],
      successDegree: json['success_degree'],
      examDayStartPoint: json['exam_day_start_point'],
      examDayEndPoint: json['exam_day_end_point'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
