import 'package:ecommercev2app/features/login/cubit/login_states.dart';
import 'package:ecommercev2app/models/login_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialLoginState());
  final dio = Dio();

  Future<void> userLogin({
    required String userName,
    required String password,
  }) async {
    print("userlogin");
    emit(LoddingLoginState());
    try {
      Response response = await dio.post(
        'https://dummyjson.com/auth/login',
        data: {"username": userName, "password": password},
      );
      final loginModel = LoginModel.fromJson(response.data);

      emit(SuccessLoginState(loginModel));
    } catch (e) {
      emit(FaiulerLoginState(e.toString()));
    }
  }
}
