class FilesModel {
  bool status;
  String message;
  List<Data> data;

  FilesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory FilesModel.fromJson(Map<String, dynamic> json) {
    return FilesModel(
      status: json['status'],
      message: json['message'],
      data: List<Data>.from(json['data'].map((x) => Data.fromJson(x))),
    );
  }
}

class Data {
  int id;
  String subjectId;
  String name;
  String url;

  Data({
    required this.id,
    required this.subjectId,
    required this.name,
    required this.url,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      subjectId: json['subject_id'],
      name: json['name'],
      url: json['url'],
    );
  }
}
