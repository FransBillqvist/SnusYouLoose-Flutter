import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart' as http;
import 'package:snusyoulooseflutter/Model/User.dart';
import 'package:snusyoulooseflutter/Redux/actions.dart';

import '../Components/app_iconbutton.dart';
import '../Model/Habit.dart';
import '../Model/Snuff.dart';
import '../Redux/app_state.dart';
import '../Styles/app_colors.dart';
import '../Config/app_media.dart';
import '../Config/app_routes.dart';
import '../Config/app_urls.dart';
import '../Widgets/snuff_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: StoreConnector<AppState, List<Snuff>>(
          converter: (store) => store.state.snuffs,
          builder: (context, List<Snuff> stateSnuff) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 164,
                width: MediaQuery.of(context).size.width,
              ),
              Text(
                "SNUS",
                style: TextStyle(color: AppColors.primary, fontSize: 48),
              ),
              ...stateSnuff
                  .map(
                    (snuff) => SnuffWidget(
                      snuff: snuff,
                      onChanged: (onChange) {
                        snuff.selected = !snuff.selected;
                        StoreProvider.of<AppState>(context)
                            .dispatch(UpdateSnuffAction(snuff));
                      },
                      key: ValueKey(snuff.id),
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }

  Future<User> fetchUserInfo(String userId) async {
    // Make API call with the authUserId
    final response = await http.post(Uri.parse(AppUrls.fetchUserGateway),
        body: {'authUserId': userId});

    // Handle the response
    if (response.statusCode == 200) {
      // Successful login
      final responseData = jsonDecode(response.body);
      final user = User.fromJson(responseData);
      print('Successfully fetched user info');
      return user;
    } else {
      print('Failed to fetch user info');
      throw Exception('Failed to fetch user info');
    }
  }

  Future<Habit> fetchUserHabit(String userId) async {
    // Make API call with the authUserId
    final response = await http.post(Uri.parse(AppUrls.fetchHabitGateway),
        body: {'authUserId': userId});

    // Handle the response
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final habit = Habit.fromJson(responseData);
      print('SUCCESFULLY fetched user habit');
      return habit;
    } else {
      // Failed login
      print('FAILED to fetch user habit');
      throw Exception('Failed to fetch user habit');
      // return Habit('','',-999,'','',-999,DateTime.parse('1970-01-12'),DateTime.parse('1970-01-12'),'','');
    }
  }
}
