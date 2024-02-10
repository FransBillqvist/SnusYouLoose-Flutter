import 'dart:developer';

import 'package:flutter/material.dart';

import '../Config/app_routes.dart';
import '../Model/SnuffShopDto.dart';
import '../Model/CreateCSDto.dart';
import '../Services/app_services.dart';
import '../Styles/app_colors.dart';
import '../Widgets/cart_widget.dart';
import '../Widgets/shop_widget.dart';

class ShopPage extends StatefulWidget {
  ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
  List<CreateCSDto> itemsInMyCart = [];

  int numberOfItemsInCart = 0;
}

class _ShopPageState extends State<ShopPage> {
  final shop = fetchSnuffShopService();
  bool showCart = false;
  List<SnuffShopDto> itemsInMyCart = [];
  final cartEmptyNotifier = ValueNotifier<bool>(false);

  void updateCart(List<CreateCSDto> updatedCart) {
    setState(() {
      updatedCart.forEach((element) {
        widget.itemsInMyCart.add(element);
      });

      widget.numberOfItemsInCart = widget.itemsInMyCart.length;
      inspect(widget.numberOfItemsInCart);
      inspect(widget.itemsInMyCart);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder<List<SnuffShopDto>>(
          future: fetchSnuffShopService(),
          builder: (context, snapshot) {
            return Stack(
              children: [
                Column(
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
                            Navigator.of(context)
                                .pushReplacementNamed(AppRoutes.home);
                          },
                          child: (!showCart
                              ? Icon(
                                  Icons.arrow_back,
                                  size: 28,
                                  color: Colors.indigoAccent[200],
                                )
                              : Padding(padding: EdgeInsets.only(left: 28))),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 24.0, left: 17),
                            child: SizedBox(
                              height: 64,
                              width: MediaQuery.of(context).size.width * 0.61,
                              child: Material(
                                elevation: 14.0,
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue,
                                child: Center(
                                  child: Text(
                                    "Add a Search-Function HERE",
                                    style: TextStyle(
                                        color: AppColors.textOnFocus2,
                                        fontSize: 16),
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
                              ValueListenableBuilder<bool>(
                                valueListenable: cartEmptyNotifier,
                                builder: (context, cartEmpty, child) {
                                  return IconButton(
                                    icon: Icon(cartEmpty
                                        ? Icons.shopping_cart
                                        : Icons.shopping_cart_outlined),
                                    color: (widget.numberOfItemsInCart <= 0
                                        ? Colors.white
                                        : Colors.indigoAccent[200]),
                                    onPressed: () {
                                      toggleCart(widget.numberOfItemsInCart);
                                    },
                                  );
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
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: ShopWidget(
                        itemsInShopFuture: shop,
                        onCartUpdated: (updatedCart) {
                          updateCart(updatedCart);
                        },
                      ),
                    ),
                  ],
                ),
                if (showCart && widget.itemsInMyCart.isNotEmpty)
                  CartWidget(
                    cartState: widget.itemsInMyCart,
                    onExit: () => toggleCart(widget.numberOfItemsInCart),
                    cartEmptyNotifier: cartEmptyNotifier,
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  void toggleCart(int valueAboutZero) {
    if (valueAboutZero > 0)
      setState(() {
        showCart = !showCart;
        cartEmptyNotifier.value = false;
      });
  }
}


//  DecoratedBox(
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(10),
                        //       color: Colors.blue),