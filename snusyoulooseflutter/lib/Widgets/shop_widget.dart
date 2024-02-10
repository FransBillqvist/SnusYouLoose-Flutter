import 'package:flutter/material.dart';

import '../Config/app_media.dart';
import '../Model/CreateCSDto.dart';
import '../Model/SnuffShopDto.dart';
import '../Services/app_services.dart';
import '../Styles/app_colors.dart';

class ShopWidget extends StatefulWidget {
  final Future<List<SnuffShopDto>> itemsInShopFuture;
  final Function(List<CreateCSDto>) onCartUpdated;
  ShopWidget({required this.itemsInShopFuture, required this.onCartUpdated});

  @override
  State<ShopWidget> createState() => _ShopWidgetState();
  List<CreateCSDto> itemsInMyCart = [];
}

class _ShopWidgetState extends State<ShopWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SnuffShopDto>>(
      future: widget.itemsInShopFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          var itemsInShop = snapshot.data;
          return ListView.separated(
            itemCount: itemsInShop!.length,
            separatorBuilder: (context, index) => SizedBox(
              height: 22,
              width: 120,
            ), // Change the height to adjust the space
            itemBuilder: (context, index) {
              var snuff = itemsInShop![index];
              return Stack(
                fit: StackFit.passthrough,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Column(
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.example3,
                          ),
                          child: SizedBox(
                            height: 82,
                            width: 348,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 1,
                                  left: 2,
                                  child: Image.asset(
                                    AppSnuffs.images[snuff.imageUrl] ?? '',
                                    width: 75,
                                    height: 75,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                Positioned(
                                  top: 12.5,
                                  left: 104,
                                  child: Text(
                                    '${snuff.brand}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.textPrimary2),
                                  ),
                                ),
                                Positioned(
                                  top: 32.5,
                                  left: 104,
                                  child: Container(
                                    width: 200,
                                    child: Text(
                                      '${snuff.type}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: AppColors.textPrimary2),
                                      softWrap: true,
                                      maxLines: 2,
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 14.5,
                    right: 28,
                    child: IconButton(
                      icon: Icon(Icons.add_circle_outline),
                      iconSize: 36,
                      onPressed: () {
                        setState(() {
                          // Replace `userId` with the actual user ID
                          AddSnuffToCart(context, snuff);
                          // Handle the press event, e.g. add the item to the cart
                        });
                      },
                    ),
                  )
                ],
              );
            },
          );
        }
      },
    );
  }

  void AddSnuffToCart(BuildContext context, SnuffShopDto snuff) {
    var userId = getUserIdService(context);
    var addSnuffToCart = CreateCSDto(snuff.id, userId);
    setState(() {
      widget.itemsInMyCart.add(addSnuffToCart);
    });

    widget.onCartUpdated(widget.itemsInMyCart);
  }
}
