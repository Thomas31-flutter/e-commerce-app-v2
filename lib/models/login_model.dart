class LoginModel {
  final String userName;
  final String accessToken;

  LoginModel(this.userName, this.accessToken);
  factory LoginModel.fromJson(jsonData) {
    return LoginModel(jsonData["username"], jsonData["accessToken"]);
  }
}
