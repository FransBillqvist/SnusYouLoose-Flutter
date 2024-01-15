import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:snusyoulooseflutter/Redux/app_state.dart';
import 'package:snusyoulooseflutter/Services/app_services.dart';
import 'package:snusyoulooseflutter/Styles/app_colors.dart';

import '../Config/app_strings.dart';
import '../Model/CurrentSnuff.dart';
import '../Model/Snuff.dart';
import '../Redux/actions.dart';
import 'image_widget.dart';

class SnuffWidget extends StatefulWidget {
  final List<CurrentSnuff> snuffs;
  SnuffWidget({required this.snuffs});

  @override
  _SnuffWidgetState createState() => _SnuffWidgetState();
}

class _SnuffWidgetState extends State<SnuffWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    return StoreProvider<AppState>(
      store: store,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: widget.snuffs.length,
            itemBuilder: (context, index) {
              final snuff = widget.snuffs[index];
              return FutureBuilder<Snuff>(
                future: fetchSnuffDetails(snuff.snusId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(); // or some other placeholder
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final snuffsort = snapshot.data;
                    if (store.state.inventorySnuffs.isNotEmpty) {
                      print("Snuff is Empty: False");
                      return SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ImageWidget(
                          imageUrl: snuffsort!.ImageUrl,
                          width: 250,
                          height: 250,
                          fit: BoxFit.scaleDown,
                        ),
                      );
                    } else {
                      print("Snuff is Empty: True");
                      return const Text(AppStrings.noInventory);
                    }
                  }
                },
              );
            },
          )
        ],
      ),
    );
  }
}



          //         PageView.builder(
          //           itemCount: widget.snuffs.length,
          //           itemBuilder: (context, index)  {
          //             final snuff = widget.snuffs[index];
          //             final snuffsort = fetchSnuffDetails(snuff.snusId);
          //             if (store.state.inventorySnuffs.isNotEmpty) {
          //               print("Snuff is Empty: False");
          //               return SizedBox(
          //                 width: MediaQuery.of(context).size.width * 0.8,
          //                 child: ImageWidget(
          //                   imageUrl: snuffsort.ImageUrl,
          //                   width: 250,
          //                   height: 250,
          //                   fit: BoxFit.scaleDown,
          //                 ),
          //               );
          //             } else {
          //               print("Snuff is Empty: True");
          //               return const Text(AppStrings.noInventory);
          //             }
          //           },
          //         ),
          //       ],
          //     ),
          //   );
          // }


// class SnuffWidget extends StatefulWidget {
//   final List<Snuff> snuffs;
//   late Function onChanged;
//   SnuffWidget({required this.snuffs});

//    @override
//   _SnuffWidgetState createState() => _SnuffWidgetState();
// }

// class _SnuffWidgetState extends State<SnuffWidget> with SingleTickerProviderStateMixin {
//   late final AnimationController _controller;
//   late final Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 1),
//       vsync: this,
//     )..repeat(reverse: true);
//     _animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeIn,
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PageView.builder(
//         itemCount: snuffs.length,
//         itemBuilder: (context, index) {
//           final snuff = snuffs[index];
//           return Row(
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: MediaQuery.of(context).size.width,
//                     child: Image.network(snuff
//                         .ImageUrl), // Assuming Snuff has an imageUrl property
//                   ),
//                   Text(
//                     snuff.Type,
//                     style: TextStyle(color: AppColors.textPrimary),
//                   ),
//                 ],
//               ),
//             ],
//           );
//         });
//   }
// }




// class SnuffWidget extends StatelessWidget {
//   final Snuff snuff;
//   final Function onChanged;
//   const SnuffWidget(
//       {required Key key, required this.snuff, required this.onChanged})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Checkbox(
//           value: snuff.selected,
//           onChanged: (onChange) {
//             onChanged(onChange);
//           },
//         ),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               snuff.Type,
//               style: TextStyle(color: AppColors.textPrimary),
//             ),
//             Text(
//               snuff.Type,
//               style: TextStyle(color: AppColors.textPrimary),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
