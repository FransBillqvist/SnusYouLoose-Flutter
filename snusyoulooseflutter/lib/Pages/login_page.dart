import 'package:flutter/material.dart';
import 'package:snusyoulooseflutter/Config/app_media.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [IconButton(onPressed: () => {print("asdasda")}), icon: AppIcons.timer_v1)],
          ),
        ),
      ),
    );
  }
}
