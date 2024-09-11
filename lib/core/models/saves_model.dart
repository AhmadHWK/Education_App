class Favorite {
  final int id;
  final int order;
  final int userId;
  final int favoritableId;
  final String favoritableType;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Favoritable favoritable;

  Favorite({
    required this.id,
    required this.order,
    required this.userId,
    required this.favoritableId,
    required this.favoritableType,
    required this.createdAt,
    required this.updatedAt,
    required this.favoritable,
  });

  factory Favorite.fromJson(Map<String, dynamic> json) {
    return Favorite(
      id: json['id'],
      order: json['order'],
      userId: json['user_id'],
      favoritableId: json['favoritable_id'],
      favoritableType: json['favoritable_type'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      favoritable: Favoritable.fromJson(json['favoritable']),
    );
  }
}

class Favoritable {
  final int id;
  final int subjectId;
  final String photoName;
  final String photoFile;
  final int createdBy;
  final int? updatedBy;
  final DateTime createdAt;
  final DateTime updatedAt;

  Favoritable({
    required this.id,
    required this.subjectId,
    required this.photoName,
    required this.photoFile,
    required this.createdBy,
    this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Favoritable.fromJson(Map<String, dynamic> json) {
    return Favoritable(
      id: json['id'],
      subjectId: json['subject_id'],
      photoName: json['photo_name'],
      photoFile: json['photo_file'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
