class BooksModel {
  final bool status;
  final String message;
  final List<Book> data;

  BooksModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory BooksModel.fromJson(Map<String, dynamic> json) {
    return BooksModel(
      status: json['status'],
      message: json['message'],
      data: List<Book>.from(json['data'].map((book) => Book.fromJson(book))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.map((book) => book.toJson()).toList(),
    };
  }
}

class Book {
  final int id;
  final String subjectId;
  final String bookName;
  final String description;
  final int pagesNumber;
  final String url;

  Book({
    required this.id,
    required this.subjectId,
    required this.bookName,
    required this.description,
    required this.pagesNumber,
    required this.url,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      subjectId: json['subject_id'],
      bookName: json['book_name'],
      description: json['description'],
      pagesNumber: json['pages_number'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'subject_id': subjectId,
      'book_name': bookName,
      'description': description,
      'pages_number': pagesNumber,
      'url': url,
    };
  }
}
