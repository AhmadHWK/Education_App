class AllSubject {
  bool? status;
  String? message;
  List<Subjects>? subjects;

  AllSubject({this.status, this.message, this.subjects});

  factory AllSubject.fromJson(Map<String, dynamic> json) {
    var subjectsJson = json['Subjects'] as List;
    List<Subjects> subjectsList =
        subjectsJson.map((subject) => Subjects.fromJson(subject)).toList();
    return AllSubject(
      status: json['status'],
      message: json['message'],
      subjects: subjectsList,
    );
  }
}

class Subjects {
  int? id;
  String? subjectName;
  int? successDegree;
  String? description;
  int? booksNumber;
  int? teachingHours;
  String? createdAt;
  String? updatedAt;

  Subjects(
      {this.id,
      this.subjectName,
      this.successDegree,
      this.description,
      this.booksNumber,
      this.teachingHours,
      this.createdAt,
      this.updatedAt});

  factory Subjects.fromJson(Map<String, dynamic> json) {
    return Subjects(
      id: json['id'],
      subjectName: json['subject_name'],
      successDegree: json['success_degree'],
      description: json['description'],
      booksNumber: json['books_number'],
      teachingHours: json['teaching_hours'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Sub {
  String? subName;
  Sub({this.subName});
  factory Sub.fromjson(Map<String, dynamic> json) {
    return Sub(subName: json['subject_name']);
  }
}
