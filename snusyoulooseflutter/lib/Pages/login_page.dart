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
  late final Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);

    _colorAnimation = ColorTween(
      begin: Color(0xFF2E5B69),
      end: Color(0xFF001A27),
    ).animate(_controller);

    // You can listen to the controller and set the state to update the color in real time
    _controller.addListener(() {
      setState(() {});
    });
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
    return Scaffold(
      backgroundColor: _colorAnimation.value, // Animated background color
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(children: [
            SizedBox(height: 100),
            Text(AppStrings.appName, textScaleFactor: 2),
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
              textAlignment: "center", // Assuming you want to hide the password
            ),
            // Other widgets...
          ]),
        ),
      ),
    );
  }
}
