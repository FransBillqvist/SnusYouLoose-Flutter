import 'dart:convert';
import 'dart:developer';
import 'dart:math';

import 'package:http/http.dart' as http;

import '../Model/CurrentSnuff.dart';
import '../Model/CurrentSnuffDto.dart';
import '../Model/Snuff.dart';
import '/Model/User.dart';
import '/Model/LoginResponse.dart';
import '/Config/app_urls.dart';

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
