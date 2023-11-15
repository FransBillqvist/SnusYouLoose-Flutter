import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snusyoulooseflutter/Components/app_iconbutton.dart';
import 'package:snusyoulooseflutter/Components/app_textfield.dart';
import 'package:snusyoulooseflutter/Config/app_media.dart';
import 'package:snusyoulooseflutter/Config/app_strings.dart';

class LoginPage extends StatelessWidget {
  final UNController = TextEditingController();
  final PWController = TextEditingController();

  LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(children: [
            SizedBox(height: 100),
            Image.asset(
              AppImages.logo_background,
              height: 200,
            ),
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
              textAlignment: "center",
            ),
          ]),
        ),
      ),
    );
  }
}
