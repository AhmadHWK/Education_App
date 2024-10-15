class SubContents {
  final bool? status;
  final String? message;
  final Data? data;
  SubContents({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SubContents.fromJson(Map<String, dynamic> json) {
    return SubContents(
      status: json['status'],
      message: json['message'],
      data: Data.fromJson(
        json['data'],
      ),
    );
  }
}

class Data {
  final String? vidos;
  final int? videosNum;
  final String? photos;
  final int? photosNum;
  final int? filesNum;
  final String? files;
  final int? booksNum;
  final String? books;
  final int? teachersNum;
  final String? exams;
  final int? examsNum;
  Data({
    required this.vidos,
    required this.videosNum,
    required this.photos,
    required this.photosNum,
    required this.filesNum,
    required this.files,
    required this.booksNum,
    required this.books,
    required this.teachersNum,
    required this.exams,
    required this.examsNum,
  });
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      vidos: json['vidos'],
      videosNum: json['videos_num'],
      photos: json['photos'],
      photosNum: json['photos_num'],
      filesNum: json['files_num'],
      files: json['files'],
      booksNum: json['books_num'],
      books: json['books'],
      teachersNum: json['teachers_num'],
      exams: json['exams'],
      examsNum: json['exams_num'],
    );
  }
}
