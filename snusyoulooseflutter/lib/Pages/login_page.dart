import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snusyoulooseflutter/Components/app_iconbutton.dart';
import 'package:snusyoulooseflutter/Components/app_textfield.dart';
import 'package:snusyoulooseflutter/Config/app_media.dart';
import 'package:snusyoulooseflutter/Config/app_strings.dart';
import 'package:snusyoulooseflutter/Styles/app_colors.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final UNController = TextEditingController();
  final PWController = TextEditingController();

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
      end: Color.fromARGB(255, 19, 55, 84),
    ).animate(_controller);

    _textColorAnimation = ColorTween(
      begin: Color.fromARGB(255, 255, 255, 255),
      end: Color.fromARGB(255, 195, 227, 215),
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
                    keyboardType: "number",
                  ),
                  SizedBox(height: 16),
                  AppTextField(
                    controllerName: PWController,
                    labelText: AppStrings.password,
                    textAlignment: "center",
                    obscureText: true,
                  ),
                  // Other widgets...
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
