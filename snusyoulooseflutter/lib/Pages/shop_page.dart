import 'package:flutter/material.dart';
import 'package:snusyoulooseflutter/Model/Snuff.dart';
import 'package:snusyoulooseflutter/Model/SnuffShopDto.dart';
import 'package:snusyoulooseflutter/Services/app_services.dart';

import '../Styles/app_colors.dart';
import '../Widgets/shop_widget.dart';

class ShopPage extends StatelessWidget {
  ShopPage({super.key});
  final shop = fetchSnuffShopService();
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
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ShopWidget(itemsInShopFuture: shop),
              ),
            ],
          );
        },
      ),
    ));
  }
}
