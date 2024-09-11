class EndPoints {
  static String baseUrl = 'http://192.168.12.227:8000/api/';
  static String signIn = 'login/user';
  static String signUp = 'registration/user';
  static String logout = 'logout/user';
  static String getprofile = 'profile/user';
  static String getSubject = 'getSubjects/user';
  static String getsaves = 'showfavorites';
  static String postsaves = 'addtofavorites';
  static String getSubContentsEndPoint(id) {
    return "getSub/user/$id";
  }

  static String getSubVideosEndPoint(id) {
    return "getVideos/user/$id";
  }

  static String getSubPhotoEndPoint(id) {
    return "retriveTHEPlanes/user/$id";
  }

  static String getExamsEndPoint(id) {
    return "getExams/user/$id";
  }

  static String getBooksEndPoint(id) {
    return "getBooks/user/$id";
  }

  static String getFilesEndPoint(id) {
    return "retrivePdf/user/$id";
  }

  static String getExamTemplateEndPoint(id) {
    return "getExamTemplate/$id";
  }

  static String getSubTeacher(id) {
    return "show-teachers-info/user/$id";
  }

  static String delsaves(id) {
    return "deletfavorites/$id";
  }

  static String submitResult(id) {
    return "Submit/user/$id";
  }
}

class ApiKeys {
  //signup
  static String firstName = 'first_name';
  static String lastName = 'last_name';
  static String email = 'email';
  static String phonenumber = 'phone_no';
  static String password = 'password';
  static String repassword = 'password_confirmation';
  //signin
  static String email1 = 'email';
  static String password1 = 'password';
  //signup error
  static String errormessage = 'message';
  static String status = 'status';
  static String doneMessage = 'message';
  //
  static String token = 'access_token';
}
