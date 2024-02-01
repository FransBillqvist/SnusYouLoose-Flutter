import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart' as http;

import '../Config/app_media.dart';
import '../Config/app_strings.dart';
import '../Config/app_urls.dart';
import '../Model/CurrentSnuffDto.dart';
import '../Redux/app_state.dart';
import '../Styles/app_colors.dart';

import 'usesnuff_widget.dart';

class InventoryWidget extends StatelessWidget {
  final List<CurrentSnuffDto> currentSnuffs;

  InventoryWidget({required this.currentSnuffs});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: currentSnuffs.length,
      itemBuilder: (context, index) {
        final currentSnuff = currentSnuffs[index];
        final store = StoreProvider.of<AppState>(context);
        final userId = store.state.user!.UserId.toString();
        final amountLeft = currentSnuff.amountRemaing;
        return FutureBuilder<List<CurrentSnuffDto>>(
          future: fetchUsersInventory(userId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // or some other placeholder
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              var snuff = snapshot.data;
              return GestureDetector(
                onLongPress: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return UseSnuffWidget(
                          currentsnuffID: snuff![index].currentSnuffId);
                    },
                  );
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: 36,
                      width: 248,
                      child: Text(
                        AppStrings.thereis +
                            " " +
                            amountLeft.toString() +
                            " " +
                            AppStrings.snuffsLeft,
                        style:
                            TextStyle(fontSize: 24, color: AppColors.primary),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Image.asset(
                        AppSnuffs.images[snuff![index].imageUrl] ?? '',
                        width: 250,
                        height: 250,
                        fit: BoxFit.scaleDown,
                      ),
                    )
                  ],
                ),
              );
            }
          },
        );
      },
    );
  }
}

Future<List<CurrentSnuffDto>> fetchUsersInventory(String userId) async {
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
