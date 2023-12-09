import 'dart:convert';

import 'package:http/http.dart' as http;

import '/Model/User.dart';
import '/Model/LoginResponse.dart';
import '/Config/app_urls.dart';

Future<LoginResponse> loginRequest(String email, String password) async {
  final url = Uri.parse(AppUrls.loginGateway);
  final body = {
    'Email': email,
    'Password': password,
  };

  final response = await http.post(url,
      headers: {'Content-Type': 'application/json'}, body: body);

  if (response.statusCode == 200) {
    return LoginResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to login');
  }
}

Future<User> fetchUserDetails(String userId) async {
  final url = Uri.parse(AppUrls.fetchUserGateway + userId);
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to fetch user details');
  }
}
