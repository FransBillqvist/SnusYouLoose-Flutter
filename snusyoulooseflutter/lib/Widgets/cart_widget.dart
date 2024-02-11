import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:snusyoulooseflutter/Config/app_routes.dart';
import 'package:snusyoulooseflutter/Model/SnuffShopDto.dart';
import 'package:snusyoulooseflutter/Styles/app_colors.dart';
import 'package:collection/collection.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

import '../Config/app_media.dart';
import '../Config/app_strings.dart';
import '../Model/CreateCSDto.dart';
import '../Services/app_services.dart';

class CartWidget extends StatefulWidget {
  List<CreateCSDto> cartState;
  final VoidCallback onExit;
  final ValueNotifier<bool> cartEmptyNotifier;

  CartWidget(
      {required this.cartState,
      required this.onExit,
      required this.cartEmptyNotifier});

  @override
  _CartWidgetState createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  late List<SnuffShopDto> itemsInMyCart;
  bool showButtons = false;
  final isFinished = ValueNotifier<bool>(false);
  SnuffShopDto? selectedItem;
  late List<CreateCSDto>? itemToBuy;

  @override
  void initState() {
    super.initState();
    getSnuffFromCartAsGroup(widget.cartState).then((value) {
      setState(() {
        itemsInMyCart = value;
      });
    });
  }

  void updateEditOfCart(String snuffId, String opt) async {
    var cart = widget.cartState;
    var index = cart.indexWhere((element) => element.snusId == snuffId);
    var item = cart[index];
    if (opt == 'add') {
      var newItem = CreateCSDto(item.snusId, getUserIdService(context));
      cart.add(newItem);
    } else if (opt == 'remove') {
      cart.removeAt(index);
    }
    setState(() {
      widget.cartState = cart;
    });

    getSnuffFromCartAsGroup(widget.cartState).then((value) {
      setState(() {
        itemsInMyCart = value;
        inspect(itemsInMyCart);
      });
    });
  }

  Future<List<SnuffShopDto>> getSnuffFromCartAsGroup(
      List<CreateCSDto> cart) async {
    var grouped = groupBy(cart, (CreateCSDto c) => c.snusId);
    List<SnuffShopDto> result = [];

    for (var entry in grouped.entries) {
      var snusId = entry.key;
      var cartItems = entry.value;

      var snuffData = await fetchSnuffDetailsWithIdService(snusId);
      var snuffShopDto = SnuffShopDto(
        snuffData.id,
        snuffData.brand,
        snuffData.type,
        snuffData.price,
        snuffData.defaultAmount,
        snuffData.imageUrl,
      );
      snuffShopDto.amount = cartItems.length;
      result.add(snuffShopDto);
    }
    return result;
  }

  Future<List<CreateCSDto>> listOfItemsToBuy(List<SnuffShopDto> cart) async {
    List<CreateCSDto> result = [];
    cart.forEach((element) {
      for (var i = 0; i < element.amount!; i++) {
        var newItem = CreateCSDto(element.id, getUserIdService(context));
        result.add(newItem);
      }
    });
    setState(() {
      itemToBuy = result;
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Padding(
        padding: const EdgeInsets.fromLTRB(29.5, 40, 8, 0),
        child: Column(
          children: [
            widget.cartState.isEmpty
                ? Container()
                : Container(
                    height: (90.0 * itemsInMyCart.length) +
                        (selectedItem != null ? 75 : 50),
                    width: MediaQuery.of(context).size.width * 0.86,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.cartBgLight2,
                      ),
                      child: ListView.builder(
                        itemCount: itemsInMyCart.length,
                        itemBuilder: (context, index) {
                          var item = itemsInMyCart[index];
                          return Stack(
                            children: [
                              Row(
                                children: [
                                  Positioned(
                                    top: 35,
                                    left: 10,
                                    child: Image.asset(
                                      AppSnuffs.images[item.imageUrl] ?? '',
                                      width: 75,
                                      height: 75,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Positioned(
                                        child: Container(
                                          width: 80, // Max width
                                          child: Text(
                                            'x ${item.amount}',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 20,
                                        top: -20,
                                        child: Container(
                                          width: 75, // Max width
                                          child: Text(
                                            item.brand,
                                            softWrap: true,
                                            maxLines: 2,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    left: 48,
                                    top: -12,
                                    child: Container(
                                      width: 100, // Max width
                                      child: Text(
                                        item.type,
                                        style: TextStyle(fontSize: 16),
                                        maxLines: 2,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 33,
                                    top: -12,
                                    child: Container(
                                      width: 95,
                                      child: IconButton(
                                        icon: Icon(Icons.edit_sharp),
                                        color: Colors.black,
                                        onPressed: () {
                                          setState(() {
                                            if (selectedItem == null)
                                              selectedItem = item;
                                            else
                                              selectedItem = null;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              if (selectedItem == item)
                                Stack(
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 100,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Positioned(
                                            top: 100,
                                            left: 100,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 58.0),
                                              child: Row(
                                                children: [
                                                  Positioned(
                                                    bottom: 20,
                                                    child: SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.261,
                                                      height: 20,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    icon: Icon(Icons.remove),
                                                    iconSize: 30,
                                                    onPressed: () {
                                                      setState(() {
                                                        if (item.amount! > 0) {
                                                          updateEditOfCart(
                                                              item.id,
                                                              'remove');
                                                          selectedItem = null;
                                                        }
                                                      });
                                                    },
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 18.0,
                                                      right: 18.0,
                                                    ),
                                                    child:
                                                        Text('${item.amount}'),
                                                  ),
                                                  IconButton(
                                                    icon: Icon(Icons.add),
                                                    iconSize: 30,
                                                    onPressed: () {
                                                      setState(() {
                                                        updateEditOfCart(
                                                            item.id, 'add');
                                                        selectedItem = null;
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
            SizedBox(
              height: 20,
            ),
            Positioned(
              top: 100,
              child: SizedBox(
                height: 60,
                width: 320,
                child: SwipeableButtonView(
                  buttonText: AppStrings.swipeToBuySnuff,
                  buttonWidget: Container(
                    child: Icon(Icons.arrow_forward, color: AppColors.example5),
                  ),
                  activeColor: AppColors.example2,
                  isFinished: isFinished.value,
                  onWaitingProcess: () {
                    Future.delayed(const Duration(milliseconds: 350), () async {
                      setState(() {
                        isFinished.value = true;
                      });
                      var finalCart = await listOfItemsToBuy(itemsInMyCart);
                      await buyMoreSnuffService(finalCart);
                    });
                  },
                  onFinish: () async {
                    completePurches();
                    widget.onExit();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      Positioned(
        top: 15,
        left: -7,
        child: IconButton(
          onPressed: () {
            widget.onExit();
          },
          icon: Icon(Icons.close_rounded),
          color: Colors.black,
          iconSize: 30,
        ),
      ),
    ]);
  }

  void completePurches() async {
    setState(() {
      itemsInMyCart = [];
      widget.cartState = [];
      widget.cartEmptyNotifier.value = true;
    });
    await Navigator.of(context).pushReplacementNamed(AppRoutes.home);
  }
}
