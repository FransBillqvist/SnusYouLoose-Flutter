import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:snusyoulooseflutter/Model/CreateCSDto.dart';
import 'package:snusyoulooseflutter/Styles/app_colors.dart';
import '../Config/app_media.dart';
import '../Redux/reducer.dart';
import '../Services/app_services.dart';

import '../Model/SnuffShopDto.dart';

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



// Version 1.0
//           return ListView.builder(
//             itemCount: itemsInShop?.length,
//             itemBuilder: (context, index) {
//               var snuff = itemsInShop![index];
//               return SizedBox(
//                 height: 36,
//                 width: 248,
//                 child: Column(
//                   children: [
//                     DecoratedBox(
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: AppColors.example1),
//                       child: SizedBox(
//                         height: 1,
//                         width: 248,
//                         child: Column(children: [
//                           Image.asset(
//                             AppSnuffs.images[snuff.imageUrl] ?? '',
//                             width: 25,
//                             height: 25,
//                             fit: BoxFit.scaleDown,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 45.0),
//                             child: Row(
//                               children: [
//                                 Text('Brand: ${snuff.brand}',
//                                     style: TextStyle(
//                                         fontSize: 13,
//                                         color: AppColors.example2))
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 45.0),
//                             child: Row(
//                               children: [
//                                 Text('Type: ${snuff.type}',
//                                     style: TextStyle(
//                                         fontSize: 13,
//                                         color: AppColors.example2)),
//                                 Padding(padding: EdgeInsets.only(bottom: 45))
//                               ],
//                             ),
//                           )
//                         ]),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           );
//         }
//       },
//     );
//   }
// }
