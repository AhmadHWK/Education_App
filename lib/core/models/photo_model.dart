class PhotoModel {
  final bool status;
  final String message;
  final List<SubPhotoModel> data;
  PhotoModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PhotoModel.fromjson(Map<String, dynamic> json) {
    var photosJson = json['data'] as List;
    List<SubPhotoModel> photosList =
        photosJson.map((img) => SubPhotoModel.fromJson(img)).toList();
    return PhotoModel(
      status: json['status'],
      message: json['message'],
      data: photosList,
    );
  }
}

class SubPhotoModel {
  final int id;
  final String subjectId;
  final String name;
  final String url;
  SubPhotoModel({
    required this.id,
    required this.subjectId,
    required this.name,
    required this.url,
  });
  factory SubPhotoModel.fromJson(Map<String, dynamic> json) {
    return SubPhotoModel(
      id: json['id'],
      subjectId: json['subject_id'],
      name: json['name'],
      url: json['url'],
    );
  }
}
