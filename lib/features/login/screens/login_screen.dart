import 'package:ecommercev2app/features/login/cubit/login_cubit.dart';
import 'package:ecommercev2app/features/login/cubit/login_states.dart';
import 'package:ecommercev2app/features/login/widgets/custom_grey_subtitle.dart';
import 'package:ecommercev2app/features/login/widgets/custome_signin_button.dart';
import 'package:ecommercev2app/features/login/widgets/custome_title_above_textfield.dart';
import 'package:ecommercev2app/features/main_layout/main_layout_bottomnavigationbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/custome_textformfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController userNameCont = TextEditingController();
  final TextEditingController PasswordCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocConsumer<LoginCubit, LoginStates>(
            listener: (context, state) async {
              print("state");
              if (state is SuccessLoginState) {
                final token = state.loginModel.accessToken;

                final prefs = await SharedPreferences.getInstance();
                await prefs.setString("token", token);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return BottomNavigationBarMainLayout();
                    },
                  ),
                );
                print("success");
              } else if (state is FaiulerLoginState) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errMsg)));
                print("fail");
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),
                      Text(
                        "Login Account",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomGreySubTitle(
                        subtitle: "Login with the regidtered account",
                      ),
                      SizedBox(height: 20),
                      CustomeTitleAboveTextField(title: "User Name"),
                      SizedBox(height: 10),
                      CustomeTextFormField(
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return "username is required";
                          } else {
                            return null;
                          }
                        },
                        controller: userNameCont,
                        hint: "Enter Your user name",
                        icon: FontAwesomeIcons.envelope,
                      ),
                      SizedBox(height: 25),
                      CustomeTitleAboveTextField(title: "Password"),
                      SizedBox(height: 10),
                      CustomeTextFormField(
                        obscureText: true,
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return "password is required";
                          } else {
                            return null;
                          }
                        },
                        controller: PasswordCont,
                        hint: "Enter Your password",
                        icon: FontAwesomeIcons.lock,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forget Password?",
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      state is LoddingLoginState
                          ? Center(child: CircularProgressIndicator())
                          : InkWell(
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  context.read<LoginCubit>().userLogin(
                                    userName: userNameCont.text,
                                    password: PasswordCont.text,
                                  );
                                  // print("button done");
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          BottomNavigationBarMainLayout(),
                                    ),
                                    (route) => false,
                                  );
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(44),
                                ),
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.center,
                        child: CustomGreySubTitle(
                          subtitle: "Or using another method",
                        ),
                      ),
                      SizedBox(height: 15),
                      CustomeSignInButton(
                        title: "Sign in with google",
                        icon: FontAwesomeIcons.google,
                      ),
                      SizedBox(height: 20),
                      CustomeSignInButton(
                        title: "Sign in with facebook",
                        icon: FontAwesomeIcons.facebook,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
