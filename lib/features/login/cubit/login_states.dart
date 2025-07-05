import 'package:ecommercev2app/models/login_model.dart';

class LoginStates {}

class InitialLoginState extends LoginStates {}

class LoddingLoginState extends LoginStates {}

class SuccessLoginState extends LoginStates {
  final LoginModel loginModel;

  SuccessLoginState(this.loginModel);
}

class FaiulerLoginState extends LoginStates {
  String errMsg;

  FaiulerLoginState(this.errMsg);
}
