import 'package:flutter/material.dart';
import 'package:snusyoulooseflutter/Styles/app_colors.dart';
import '../Config/app_media.dart';
import '../Redux/reducer.dart';
import '../Services/app_services.dart';

import '../Model/SnuffShopDto.dart';

class ShopWidget extends StatelessWidget {
  final Future<List<SnuffShopDto>> itemsInShopFuture;
  ShopWidget({required this.itemsInShopFuture});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SnuffShopDto>>(
      future: itemsInShopFuture,
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
              height: 62,
              width: 120,
            ), // Change the height to adjust the space
            itemBuilder: (context, index) {
              var snuff = itemsInShop![index];
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.example3,
                      ),
                      child: SizedBox(
                        height: 90,
                        width: 348,
                        child: Column(children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 188.0, top: 6),
                            child: Row(
                              children: [
                                Image.asset(
                                  AppSnuffs.images[snuff.imageUrl] ?? '',
                                  width: 75,
                                  height: 75,
                                  fit: BoxFit.scaleDown,
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 25.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          '${snuff.brand}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: AppColors.example2),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          '${snuff.type}',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: AppColors.example2),
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
    );
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
