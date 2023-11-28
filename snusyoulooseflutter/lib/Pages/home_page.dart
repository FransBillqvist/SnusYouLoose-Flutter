import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Components/app_iconbutton.dart';
import '../Styles/app_colors.dart';
import '../Config/app_media.dart';
import '../Config/app_routes.dart';
import '../Config/app_urls.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  fetchUserInfo(String userId) async {
    // Make API call with the authUserId
    final response = await http.post(Uri.parse(AppUrls.fetchUserGatewat),
        body: {'authUserId': userId});

    // Handle the response
    if (response.statusCode == 200) {
      // Successful login
      print('Successfully fetched user info');
    } else {
      // Failed login
      print('Failed to fetch user info');
    }
  }
}
