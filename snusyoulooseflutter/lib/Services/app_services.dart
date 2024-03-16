import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart' as http;
import 'package:snusyoulooseflutter/Model/AuthResponse.dart';

import '../Config/app_routes.dart';
import '../Config/app_urls.dart';
import '../Model/NicotineStats.dart';
import '../Model/SnuffShopDto.dart';
import '../Model/ProgressionDto.dart';
import '../Model/CreateCSDto.dart';
import '../Model/CurrentSnuffDto.dart';
import '../Model/HabitDto.dart';
import '../Model/StatisticDto.dart';
import '../Model/User.dart';
import '../Model/LoginResponse.dart';
import '../Redux/app_state.dart';

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
    print(
        'This is the fetchUserProgression response: ${DateTime.now()} ${response.body} ');
    if (response.statusCode == 200) {
      final progression = ProgressionDto.fromJson(jsonDecode(response.body));
      print('This is the fetch progression: $progression  ${DateTime.now()}');
      inspect(progression);
      return progression;
    }
  } catch (err) {
    print('FAILED TO FETCH USER PROGRESSION $err');
  }
  throw Exception('Failed to fetch user progression ${DateTime.now()}');
}

Future<ProgressionDto> postNewProgressionService(String userId) async {
  try {
    final response = await http.post(
        Uri.parse(AppUrls.postNewProgression + userId),
        headers: {'Content-Type': 'application/json'});
    print(
        'This is the postNewProgression response: ${response.body} ${DateTime.now()} ');
    if (response.statusCode == 200) {
      final progression = ProgressionDto.fromJson(jsonDecode(response.body));
      print('This is the new POST progression: $progression');
      inspect(progression);
      return progression;
    }
  } catch (err) {
    print('FAILED TO POST NEW PROGRESSION $err');
  }
  throw Exception('Failed to post new progression ${DateTime.now()}');
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

Future<bool> postCurrentSnuffToArchive(String currentSnuffId) async {
  try {
    final response = await http.post(
        Uri.parse(AppUrls.postCSToArchive + currentSnuffId),
        headers: {'Content-Type': 'application/json'});
    print('This is the postCSToArchive response: ${response.body} ');
    if (response.statusCode == 200) {
      print('This is the 200 => postCSToArchive response: ${response.body} ');
      return true;
    } else {
      return false;
    }
  } catch (err) {
    print('FAILED TO POST CS TO ARCHIVE $err');
  }
  throw Exception('Failed to post CS to archive');
}

String getUserIdService(BuildContext context) {
  final store = StoreProvider.of<AppState>(context);
  final userId = store.state.user?.UserId;

  if (userId == null || userId.isEmpty) {
    throw Exception('UserId is null or empty');
  }

  return userId;
}

Future buyMoreSnuffService(List<CreateCSDto> shopList) async {
  try {
    inspect(shopList);
    final response = await http.post(Uri.parse(AppUrls.postForMoreSnuff),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(shopList.map((item) => item.toJson()).toList()));
    print('This is the buyMoreSnuff response: ${response.body} ');
    if (response.statusCode == 200) {
      print('This is the 200 => buyMoreSnuff response: ${response.body} ');
    }
  } catch (err) {
    print('FAILED TO BUY MORE SNUFF $err');
  }
  throw Exception('Failed to buy more snuff');
}

Future<AuthResponse> postCreateAuthUser(
    String email, String password, String fullname, String username) async {
  final body = {
    'email': email,
    'password': password,
    'fullname': fullname,
    'username': username,
    'confirmPassword': password,
  };
  print(body);
  try {
    final response = await http
        .post(Uri.parse(AppUrls.createAuthUser),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(body))
        .timeout(const Duration(seconds: 5));

    if (response.statusCode == 200) {
      print("this is the response: ${response.body} ");
      return AuthResponse.fromJson(jsonDecode(response.body));
    } else {
      print("FAILED TO CREATE USER postCreateUser");
      throw Exception('Failed to create user');
    }
  } catch (e) {
    print("FAILED TO CREATE USER postCreateUser $e");
    throw Exception('Failed to create user');
  }
}

Future postCreateUser(User newUser) async {
  try {
    final response = await http.post(
      Uri.parse(AppUrls.createUser),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(newUser.toJson()),
    );
    inspect(response.body);
    print('This is the postCreateUser response: ${response.body} ');
    if (response.statusCode == 200) {
      print('This is the 200 => postCreateUser response: ${response.body} ');
    } else {
      throw Exception(
          'Failed to post create user. Status code: ${response.statusCode}');
    }
  } catch (err) {
    print('FAILED TO POST CREATE USER $err');
    throw Exception('Failed to post create user ${DateTime.now()}');
  }
}

Future<Duration> fetchTimeToNextDose(String userid) async {
  try {
    final response = await http.get(
        Uri.parse(AppUrls.fetchTimeToNextDose + userid),
        headers: {'Content-Type': 'application/json'});
    print('This is the fetchTimeToNextDose response: ${response.body} ');
    if (response.statusCode == 200) {
      final timeToNextDose = jsonDecode(response.body);
      final result = parseTime(timeToNextDose);
      print('This is the timeToNextDose: $timeToNextDose');
      inspect(timeToNextDose);
      return result;
    }
  } catch (err) {
    print('FAILED TO FETCH TIME TO NEXT DOSE $err');
  }
  throw Exception('Failed to fetch time to next dose');
}

Future<List<int>> fetchUsedAndRemaingSnuffToday(String userId) async {
  try {
    final response = await http.get(
        Uri.parse(AppUrls.fetchUsedNLeftSnuff + userId),
        headers: {'Content-Type': 'application/json'});
    print(
        'This is the fetchUsedAndRemaingSnuffToday response: ${response.body} ');
    if (response.statusCode == 200) {
      final usedNLeft = jsonDecode(response.body);
      print('This is the usedNLeft: $usedNLeft');
      inspect(usedNLeft);
      return List<int>.from(usedNLeft);
    }
  } catch (err) {
    print('FAILED TO FETCH USED AND REMAING SNUFF TODAY $err');
  }
  throw Exception('Failed to fetch used and remaing snuff today');
}

Future<StatisticDto> fetchDailyStatisticService(String userId) async {
  try {
    final response = await http.get(
        Uri.parse(AppUrls.fetchStatisticsForToday + userId),
        headers: {'Content-Type': 'application/json'});
    print('This is the fetchDailyStatisticService response: ${response.body} ');
    if (response.statusCode == 200) {
      final statistic = StatisticDto.fromJson(jsonDecode(response.body));
      print('This is the statistic: $statistic');
      inspect(statistic);
      return statistic;
    }
  } catch (err) {
    print('FAILED TO FETCH DAILY STATISTIC $err');
  }
  throw Exception('Failed to fetch daily statistic');
}

Future<StatisticDto> fetchStatisticsForPeriodService(
    String userId, DateTime start, DateTime end) async {
  try {
    final response = await http.get(
        Uri.parse(AppUrls.fetchStatisticsForPeriod +
            userId +
            '/' +
            start.toIso8601String() +
            '/' +
            end.toIso8601String()),
        headers: {'Content-Type': 'application/json'});
    print(
        'This is the fetchStatisticsForPeriodService response: ${response.body} ');
    if (response.statusCode == 200) {
      final statistic = StatisticDto.fromJson(jsonDecode(response.body));
      print('This is the statistic: $statistic');
      inspect(statistic);
      return statistic;
    }
  } catch (err) {
    print('FAILED TO FETCH STATISTICS FOR PERIOD $err');
  }
  throw Exception('Failed to fetch statistics for period');
}

Future<StatisticDto> fetchLifeTimeStatisticService(String userId) async {
  try {
    final response = await http.get(
        Uri.parse(AppUrls.fetchAllTimeStatistic + userId),
        headers: {'Content-Type': 'application/json'});
    print(
        'This is the fetchLifeTimeStatisticService response: ${response.body} ');
    if (response.statusCode == 200) {
      final statistic = StatisticDto.fromJson(jsonDecode(response.body));
      print('This is the statistic: $statistic');
      inspect(statistic);
      return statistic;
    }
  } catch (err) {
    print('FAILED TO FETCH LIFE TIME STATISTIC $err');
  }
  throw Exception('Failed to fetch life time statistic');
}

Duration parseTime(String time) {
  List<String> parts = time.split(':');
  return Duration(
    hours: int.parse(parts[0]),
    minutes: int.parse(parts[1]),
    seconds: int.parse(parts[2]),
  );
}

List<int> splitDuration(Duration duration) {
  int hours = duration.inHours;
  int minutes = duration.inMinutes.remainder(60);
  int seconds = duration.inSeconds.remainder(60);
  return [hours, minutes, seconds];
}

int getTotalSeconds(Duration duration) {
  return duration.inSeconds;
}

Future<List<SnuffShopDto>> searchForSnuff(String query) async {
  var allData = await fetchSnuffShopService();

  var result = allData
      .where((element) =>
          element.brand.toLowerCase().contains(query.toLowerCase()) ||
          element.type.toLowerCase().contains(query.toLowerCase()))
      .toList();

  return result;
}

Future<NicotineStats> fetchNicotineStats(String userId, String period) async {
  try {
    final response = await http.get(
        Uri.parse(AppUrls.fetchNicotineStatistics + userId + '/$period'),
        headers: {'Content-Type': 'application/json'});
    print('This is the fetchNicotineStats response: ${response.body} ');
    if (response.statusCode == 200) {
      final nicotineStats = NicotineStats.fromJson(jsonDecode(response.body));
      print('This is the nicotineStats: $nicotineStats');
      inspect(nicotineStats);
      return nicotineStats;
    }
  } catch (err) {
    print('FAILED TO FETCH NICOTINE STATS $err');
  }
  throw Exception('Failed to fetch nicotine stats');
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
