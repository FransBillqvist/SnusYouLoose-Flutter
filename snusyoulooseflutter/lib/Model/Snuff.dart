import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Config/app_urls.dart';

class Snuff {
  String id;
  String Brand;
  String Type;
  int Price;
  int DefaultAmount;
  String ImageUrl;
  int Size;
  // bool selected;

  Snuff(this.id, this.Brand, this.Type, this.Price, this.DefaultAmount,
      this.ImageUrl, this.Size);

  factory Snuff.fromJson(Map<String, dynamic> json) => Snuff(
        json['id'] as String,
        json['brand'] as String,
        json['type'] as String,
        json['price'] as int,
        json['defaultAmount'] as int,
        json['imageUrl'] as String,
        json['size'] as int,
        // json['selected'] as bool,
      );

  static Future<Snuff> fetchSnuffDetails(String snuffId) async {
    try {
      final response = await http.get(Uri.parse(AppUrls.fetchSnuff + snuffId),
          headers: {'Content-Type': 'application/json'});
      print('This is the fetchSnuffDetails response: ${response.body} ');
      if (response.statusCode == 200) {
        final snuff = jsonDecode(response.body);
        print('This is the snuff: $snuff');
        inspect(snuff);

        return Snuff.fromJson(jsonDecode(response.body));
      }
    } catch (err) {
      print('FAILED TO FETCH SNUFF DETAILS $err');
    }
    throw Exception('Failed to fetch snuff details');
  }
}
