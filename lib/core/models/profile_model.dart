class ProfileModel {
  final int status;
  final String message;
  final Data data;
  ProfileModel({
    required this.status,
    required this.message,
    required this.data,
  });
  factory ProfileModel.fromjson(Map<String, dynamic> jsonData) {
    return ProfileModel(
        status: jsonData['status'],
        message: jsonData['message'],
        data: Data.fromjson(jsonData['data']));
  }
}

class Data {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNo;
  final String role;
  final dynamic emailVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  Data({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNo,
    required this.role,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromjson(Map<String, dynamic> jsonData) {
    return Data(
        id: jsonData['id'],
        firstName: jsonData['first_name'],
        lastName: jsonData['last_name'],
        email: jsonData['email'],
        phoneNo: jsonData['phone_no'],
        role: jsonData['role'],
        emailVerifiedAt: jsonData['email_verified_at'],
        createdAt: jsonData['created_at'],
        updatedAt: jsonData['updated_at']);
  }
}
