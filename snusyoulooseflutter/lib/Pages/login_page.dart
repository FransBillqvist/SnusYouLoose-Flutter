import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Components/app_iconbutton.dart';
import '../Components/app_textfield.dart';
import '../Config/app_media.dart';
import '../Config/app_routes.dart';
import '../Config/app_strings.dart';
import '../Config/app_urls.dart';
import '../Styles/app_colors.dart';
import '../Model/User.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final UNController = TextEditingController();
  final PWController = TextEditingController();

  var usernamefield = '';
  var passwordfield = '';

  late final AnimationController _controller;
  late final Animation<Color?> _bgColorAnimation;
  late final Animation<Color?> _textColorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      lowerBound: 0.6,
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);

    _bgColorAnimation = ColorTween(
      begin: AppColors.loginLightBackgroundColor,
      end: AppColors.loginDeepBackgroundColor,
    ).animate(_controller);

    _textColorAnimation = ColorTween(
      begin: AppColors.loginDeepTextColor,
      end: AppColors.loginLightTextColor,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    UNController.dispose();
    PWController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_bgColorAnimation, _textColorAnimation]),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: _bgColorAnimation.value,
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  SizedBox(height: 100),
                  Text(
                    AppStrings.appName,
                    textScaleFactor: 2,
                    style: TextStyle(color: _textColorAnimation.value),
                  ),
                  SizedBox(height: 40),
                  AppTextField(
                    controllerName: UNController,
                    labelText: AppStrings.username,
                    textAlignment: "center",
                    keyboardType: "email",
                    onChanged: (value) {
                      usernamefield = value;
                    },
                  ),
                  SizedBox(height: 16),
                  AppTextField(
                    controllerName: PWController,
                    labelText: AppStrings.password,
                    textAlignment: "center",
                    obscureText: true,
                    onChanged: (value) {
                      passwordfield = value;
                    },
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () async {
                        final user = await doLogin(
                            context, usernamefield, passwordfield);
                        if (user.Success == false) {
                          print("Login failed");
                        } else {
                          Navigator.of(context)
                              .pushReplacementNamed(AppRoutes.home);
                        }
                      },
                      child: Text(AppStrings.login),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.example2,
                        foregroundColor: AppColors.textPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 38),
                  SizedBox(
                    width: 230,
                    height: 48,
                    child: Container(
                        color: Colors.transparent,
                        child: ElevatedButton(
                            onPressed: () {
                              print("Exec");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black87,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(36),
                                ),
                              ),
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(AppImages.editGoogle,
                                      width: 34, height: 34),
                                  Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(12, 0, 8, 0)),
                                  Text(AppStrings.loginWithGoogle)
                                ]))),
                  ),
                  SizedBox(height: 18),
                  SizedBox(
                    width: 230,
                    height: 48,
                    child: Container(
                      color: Colors.transparent,
                      child: ElevatedButton(
                        onPressed: () {
                          print("Exec Facebook");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black87,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(36),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(AppImages.logoFacebook,
                                width: 34, height: 34),
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Text(AppStrings.loginWithFacebook)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Future<User> doLogin(BuildContext ctex, String email, String password) async {
  final body = {
    'Email': email,
    'Password': password,
  };
  final response = await http.post(Uri.parse(AppUrls.loginGateway),
      headers: {'Content-Type': 'application/json'}, body: jsonEncode(body));
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    print(json);
    final user = User.fromJson(json);
    return user;
  } else {
    return User(false, '', '', '', '', '', '', '', '', '', '', '');
  }
}
