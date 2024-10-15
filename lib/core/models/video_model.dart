class VideoModel {
  bool status;
  String message;
  List<SubVideoModel> data;
  int totalVideos;
  VideoModel(
      {required this.status,
      required this.message,
      required this.data,
      required this.totalVideos});
  factory VideoModel.fromjson(Map<String, dynamic> json) {
    var videosJson = json['data'] as List;
    List<SubVideoModel> videosDataList =
        videosJson.map((video) => SubVideoModel.fromjson(video)).toList();
    return VideoModel(
        status: json['status'],
        message: json['message'],
        data: videosDataList,
        totalVideos: json['total_videos']);
  }
}

class SubVideoModel {
  final int id;
  final String subjectId;
  final String name;
  final String url;
  SubVideoModel({
    required this.id,
    required this.subjectId,
    required this.name,
    required this.url,
  });
  factory SubVideoModel.fromjson(Map<String, dynamic> json) {
    return SubVideoModel(
        id: json['id'],
        subjectId: json['subject_id'],
        name: json['name'],
        url: json['url']);
  }
}
