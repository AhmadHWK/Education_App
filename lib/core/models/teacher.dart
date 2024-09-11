class TeacherModel {
  final bool status;
  final String message;
  final List<Teacher> data;

  TeacherModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory TeacherModel.fromJson(Map<String, dynamic> json) {
    return TeacherModel(
      status: json['status'],
      message: json['message'],
      data: List<Teacher>.from(
          json['data'].map((teacherJson) => Teacher.fromJson(teacherJson))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.map((teacher) => teacher.toJson()).toList(),
    };
  }
}

class Teacher {
  final String firstName;
  final String lastName;
  final String phoneNo;
  final int teachingDuration;
  final String subjectName;

  Teacher({
    required this.firstName,
    required this.lastName,
    required this.phoneNo,
    required this.teachingDuration,
    required this.subjectName,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      firstName: json['first_name'],
      lastName: json['last_name'],
      phoneNo: json['phone_no'],
      teachingDuration: json['teaching_duration'],
      subjectName: json['subject_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'phone_no': phoneNo,
      'teaching_duration': teachingDuration,
      'subject_name': subjectName,
    };
  }
}
