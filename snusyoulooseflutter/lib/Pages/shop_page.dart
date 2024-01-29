import 'package:flutter/material.dart';
import 'package:snusyoulooseflutter/Model/Snuff.dart';
import 'package:snusyoulooseflutter/Model/SnuffShopDto.dart';
import 'package:snusyoulooseflutter/Services/app_services.dart';

import '../Styles/app_colors.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: FutureBuilder<List<SnuffShopDto>>(
        future: fetchSnuffShopService(),
        builder: (context, snapshot) {
          return Column(
            children: [
              Row(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 18.0),
                      child: SizedBox(
                        height: 104,
                        width: MediaQuery.of(context).size.width * 0.91,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue),
                          child: Center(
                            child: Text(
                              "Add a Search-Function HERE",
                              style: TextStyle(
                                  color: AppColors.textOnFocus2, fontSize: 24),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
    ));
  }
}
