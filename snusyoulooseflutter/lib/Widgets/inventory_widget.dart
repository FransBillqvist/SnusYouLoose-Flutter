import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Config/app_urls.dart';
import '../Model/CurrentSnuff.dart';
import '../Model/snuff.dart';
import '../widgets/image_widget.dart';

class InventoryWidget extends StatelessWidget {
  final List<CurrentSnuff> currentSnuffs;
  late final Future<Snuff> snuffService;

  InventoryWidget({required this.currentSnuffs});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: currentSnuffs.length,
      itemBuilder: (context, index) {
        final currentSnuff = currentSnuffs[index];
        return FutureBuilder<Snuff>(
          future: snuffService = fetchSnuffDetails(currentSnuff.snusId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // or some other placeholder
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final snuff = snapshot.data;
              return SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ImageWidget(
                  imageUrl: snuff!.ImageUrl,
                  width: 250,
                  height: 250,
                  fit: BoxFit.scaleDown,
                ),
              );
            }
          },
        );
      },
    );
  }
}

Future<Snuff> fetchSnuffDetails(String snuffId) async {
  try {
    final response = await http.get(Uri.parse(AppUrls.fetchSnuff + snuffId),
        headers: {'Content-Type': 'application/json'});
    print('This is the fetchSnuffDetails response: ${response.body} ');
    if (response.statusCode == 200) {
      final snuff = Snuff.fromJson(jsonDecode(response.body));
      print('This is the snuff: $snuff');
      inspect(snuff);

      return snuff;
    }
  } catch (err) {
    print('FAILED TO FETCH SNUFF DETAILS inventory_widget $err');
  }
  throw Exception('Failed to fetch snuff details');
}
