import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart' as http;
import 'package:snusyoulooseflutter/Model/HabitRequest.dart';
import 'package:snusyoulooseflutter/Model/ProgressionDto.dart';
import 'package:snusyoulooseflutter/Model/SnuffShopDto.dart';
import 'package:snusyoulooseflutter/Redux/app_state.dart';

import '../Config/app_routes.dart';
import '../Model/CurrentSnuff.dart';
import '../Model/CurrentSnuffDto.dart';
import '../Model/Habit.dart';
import '../Model/HabitDto.dart';
import '../Model/Snuff.dart';
import '../Model/User.dart';
import '../Model/LoginResponse.dart';
import '../Config/app_urls.dart';
import '../Redux/actions.dart';

Future<LoginResponse> loginRequest(String email, String password) async {
  final body = {
    'Email': email,
    'Password': password,
  };
  print(body);
  try {
    final response = await http
        .post(Uri.parse(AppUrls.loginGateway),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(body))
        .timeout(const Duration(seconds: 5));

    if (response.statusCode == 200) {
      print("this is the response: ${response.body} ");
      return LoginResponse.fromJson(jsonDecode(response.body));
    } else {
      print("FAILED TO LOGIN loginRequest ESLE Line 23");
      throw Exception('Failed to login');
    }
  } catch (e) {
    print("FAILED TO LOGIN loginRequest $e");
    throw Exception('Failed to login');
  }
}

Future<User> fetchUserDetails(String userId) async {
  try {
    final response = await http.get(
        Uri.parse(AppUrls.fetchUserGateway + userId),
        headers: {'Content-Type': 'application/json'});
    print("This is the FetchUserDetails response: ${response.body} ");
    if (response.statusCode == 200) {
      final newUser = User.fromJson(jsonDecode(response.body));
      print("This is the newUser: $newUser");
      inspect(newUser);
      return newUser;
    }
  } catch (e) {
    print("FAILED TO FETCH USER DETAILS $e");
  }
  throw Exception('Failed to fetch user details');
}

Future<List<CurrentSnuffDto>> fetchUsersInventoryService(String userId) async {
  try {
    final response = await http.get(
        Uri.parse(AppUrls.fetchUsersInventory + userId),
        headers: {'Content-Type': 'application/json'});
    print('This is the fetchUsersInventory response: ${response.body} ');
    if (response.statusCode == 200) {
      final inventory = jsonDecode(response.body);
      print('This is the inventory: $inventory');
      inspect(inventory);
      var result = List<CurrentSnuffDto>.from(
          inventory.map((x) => CurrentSnuffDto.fromJson(x))).toList();
      return result;
      // return inventory as List<CurrentSnuff>;
    }
  } catch (err) {
    print('FAILED TO FETCH USERS INVENTORY $err');
  }
  throw Exception('Failed to fetch users inventory');
}

Future<HabitDto> fetchUserHabitService(
    String userId, BuildContext context) async {
  try {
    final response = await http.get(
        Uri.parse(AppUrls.fetchHabitGateway + userId),
        headers: {'Content-Type': 'application/json'});
    print('This is the fetchUserHabit response: ${response.body} ');
    print('The response status code is: ${response.statusCode}');
    if (response.statusCode == 200) {
      final habit = HabitDto.fromJson(jsonDecode(response.body));
      print('This is the habit: $habit');
      inspect(habit);
      return habit;
    }
    if (response.statusCode == 404) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.habit);
    }
  } catch (err) {
    Navigator.of(context).pushReplacementNamed(AppRoutes.habit);
    print('FAILED TO FETCH USER HABIT $err  ${DateTime.now()}');
  }
  throw Exception('Failed to fetch user habit');
}

Future<HabitDto> createHabitService(HabitDto newHabit, String userId) async {
  try {
    final response = await http.post(
        Uri.parse(AppUrls.createHabitGateway + userId),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(newHabit.toJson()));
    print('This is the createHabit response: ${response.body} ');
    print('The createHabit response status code is: ${response.statusCode}');
    if (response.statusCode == 200) {
      final habit = HabitDto.fromJson(jsonDecode(response.body));
      print('This is the habit: $habit');
      inspect(habit);
      return habit;
    }
  } catch (err) {
    print('FAILED TO CREATE HABIT $err  ${DateTime.now()}');
  }
  throw Exception('Failed to create habit');
}

Future<ProgressionDto> fetchUserProgressionService(String userId) async {
  try {
    final response = await http.get(
        Uri.parse(AppUrls.fetchUserProgression + userId),
        headers: {'Content-Type': 'application/json'});
    print('This is the fetchUserProgression response: ${response.body} ');
    if (response.statusCode == 200) {
      final progression = ProgressionDto.fromJson(jsonDecode(response.body));
      print('This is the progression: $progression');
      inspect(progression);
      return progression;
    }
  } catch (err) {
    print('FAILED TO FETCH USER PROGRESSION $err');
  }
  throw Exception('Failed to fetch user progression');
}

Future postSnuffTakenService(String currentSnuffId, int amount) async {
  try {
    final response = await http.post(Uri.parse(AppUrls.postSnuffTaken +
        'CurrentsnuffId=$currentSnuffId&amount=$amount'));
    print('This is the postSnuffTaken response: ${response.body} ');
    if (response.statusCode == 200) {
      print('This is the 200 => postSnuffTaken response: ${response.body} ');
    }
  } catch (err) {
    print('FAILED TO POST SNUFF TAKEN $err');
  }
  throw Exception('Failed to post snuff taken');
}

Future<List<SnuffShopDto>> fetchSnuffShopService() async {
  try {
    final response = await http.get(Uri.parse(AppUrls.fetchSnuffShop),
        headers: {'Content-Type': 'application/json'});
    print('This is the fetchSnuffShop response: ${response.body} ');
    if (response.statusCode == 200) {
      final snuff = jsonDecode(response.body);
      print('This is the snuff: $snuff');
      inspect(snuff);
      var result =
          List<SnuffShopDto>.from(snuff.map((x) => SnuffShopDto.fromJson(x)))
              .toList();
      return result;
    }
  } catch (err) {
    print('FAILED TO FETCH SNUFF SHOP $err');
  }
  throw Exception('Failed to fetch snuff shop');
}

Future<SnuffShopDto> fetchSnuffDetailsWithIdService(String snuffId) async {
  try {
    final response = await http.get(Uri.parse(AppUrls.fetchSnuff + snuffId),
        headers: {'Content-Type': 'application/json'});
    print('This is the fetchSnuffDetails response: ${response.body} ');
    if (response.statusCode == 200) {
      final snuff = SnuffShopDto.fromJson(jsonDecode(response.body));
      print('This is the snuff: $snuff');

      return snuff;
    }
  } catch (err) {
    print('FAILED TO FETCH SNUFF WITH ID: {$snuffId} DETAILS $err');
  }
  throw Exception('Failed to fetch snuff details');
}

String getUserIdService(BuildContext context) {
  final store = StoreProvider.of<AppState>(context);
  final userId = store.state.user?.UserId;

  if (userId == null || userId.isEmpty) {
    throw Exception('UserId is null or empty');
  }

  return userId;
}

// Future<Snuff> fetchSnuffDetails(String snuffId) async {
//   try {
//     final response = await http.get(Uri.parse(AppUrls.fetchSnuff + snuffId),
//         headers: {'Content-Type': 'application/json'});
//     print('This is the fetchSnuffDetails response: ${response.body} ');
//     if (response.statusCode == 200) {
//       final snuff = jsonDecode(response.body) as List<dynamic>;
//       print('This is the snuff: $snuff');

//       return Snuff.fromJson(jsonDecode(response.body));
//     }
//   } catch (err) {
//     print('FAILED TO FETCH SNUFF DETAILS $err');
//   }
//   throw Exception('Failed to fetch snuff details');
// }
