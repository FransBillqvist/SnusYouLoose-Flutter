import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:snusyoulooseflutter/Redux/app_state.dart';
import 'package:snusyoulooseflutter/Styles/app_colors.dart';

import '../Model/Snuff.dart';
import '../Redux/actions.dart';

class SnuffWidget extends StatelessWidget {
  final List<Snuff> snuffs;
  late Function onChanged;
  SnuffWidget({required this.snuffs});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: snuffs.length,
        itemBuilder: (context, index) {
          final snuff = snuffs[index];
          return Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    child: Image.network(snuff
                        .ImageUrl), // Assuming Snuff has an imageUrl property
                  ),
                  Text(
                    snuff.Type,
                    style: TextStyle(color: AppColors.textPrimary),
                  ),
                  Text(
                    snuff.Type,
                    style: TextStyle(color: AppColors.textPrimary),
                  ),
                ],
              ),
            ],
          );
        });
  }
}




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
