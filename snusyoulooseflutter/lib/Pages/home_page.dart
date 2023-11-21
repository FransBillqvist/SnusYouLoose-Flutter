import 'package:flutter/material.dart';
import 'package:snusyoulooseflutter/Components/app_iconbutton.dart';
import 'package:snusyoulooseflutter/Styles/app_colors.dart';

import '../Config/app_media.dart';
import '../Config/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Home Page',
              style: TextStyle(color: AppColors.primary),
            ),
            SizedBox(height: 200),
            AppIconButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(AppRoutes.login),
                icon: AppIcons.home)
          ],
        ),
      ),
    );
  }
}
