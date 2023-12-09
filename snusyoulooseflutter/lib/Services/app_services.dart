import 'dart:convert';

import 'package:http/http.dart' as http;

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
    final response = await http.post(Uri.parse(AppUrls.loginGateway),
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(body));

    if (response.statusCode == 200) {
      print("this is the response: ${response.body} ");
      return LoginResponse.fromJson(jsonDecode(response.body));
    } else {
      print("FAILED TO LOGIN loginRequest");
      throw Exception('Failed to login');
    }
  } catch (e) {
    print("FAILED TO LOGIN loginRequest");
    throw Exception('Failed to login');
  }
}

Future<User> fetchUserDetails(String userId) async {
  final response = await http.get(Uri.parse(AppUrls.fetchUserGateway + userId),
      headers: {'Content-Type': 'application/json'});
  print("This is the FetchUserDetails response: ${response.body} ");
  if (response.statusCode == 200) {
    final newUser = User.fromJson(jsonDecode(response.body));
    print("YESSS SIIIR");
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to fetch user details');
  }
}
