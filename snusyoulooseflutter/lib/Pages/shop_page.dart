import 'package:flutter/material.dart';
import 'package:snusyoulooseflutter/Model/Snuff.dart';
import 'package:snusyoulooseflutter/Model/SnuffShopDto.dart';
import 'package:snusyoulooseflutter/Services/app_services.dart';

import '../Styles/app_colors.dart';
import '../Widgets/shop_widget.dart';

class ShopPage extends StatefulWidget {
  ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
  int numberOfItemsInCart = 0;
}

class _ShopPageState extends State<ShopPage> {
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
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.transparent,
                      ),
                      elevation: MaterialStateProperty.all(0),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 28,
                      color: Colors.indigoAccent[200],
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24.0, left: 17),
                      child: SizedBox(
                        height: 64,
                        width: MediaQuery.of(context).size.width * 0.61,
                        child: Material(
                          elevation:
                              14.0, // Change this value to adjust the elevation
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                          child: Center(
                            child: Text(
                              "Add a Search-Function HERE",
                              style: TextStyle(
                                  color: AppColors.textOnFocus2, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Stack(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.shopping_cart),
                            color: (widget.numberOfItemsInCart <= 0
                                ? Colors.white
                                : Colors.indigoAccent[200]),
                            onPressed: () {
                              // Handle the press event
                            },
                          ),
                          if (widget.numberOfItemsInCart > 0)
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, left: 26),
                              child: Positioned(
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  constraints: BoxConstraints(
                                    minWidth: 12,
                                    minHeight: 12,
                                  ),
                                  child: Text(
                                    '${widget.numberOfItemsInCart}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      )),
                ], //Row ends HERE:
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


//  DecoratedBox(
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(10),
                        //       color: Colors.blue),