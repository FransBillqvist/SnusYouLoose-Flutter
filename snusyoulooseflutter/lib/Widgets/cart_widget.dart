import 'package:flutter/material.dart';
import 'package:snusyoulooseflutter/Model/SnuffShopDto.dart';
import 'package:snusyoulooseflutter/Styles/app_colors.dart';
import 'package:collection/collection.dart';

import '../Model/CreateCSDto.dart';
import '../Services/app_services.dart';

class CartWidget extends StatefulWidget {
  final List<CreateCSDto> cartState;
  final VoidCallback onExit;
  CartWidget({required this.cartState, required this.onExit});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Padding(
        padding: const EdgeInsets.fromLTRB(29.5, 40, 8, 0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.95,
          width: MediaQuery.of(context).size.width * 0.86,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.cartBgLight2,
            ),
          ),
        ),
      ),
      Positioned(
          top: 42,
          left: 36,
          child: Text(
            "Cart",
            style: TextStyle(fontSize: 18),
          )),
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
}
