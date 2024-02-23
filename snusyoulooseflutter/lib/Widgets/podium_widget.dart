import 'package:flutter/material.dart';

import '../Config/app_media.dart';
import '../Model/Snuff.dart';
import '../Styles/app_colors.dart';

class PodiumWidget extends StatelessWidget {
  final int position;
  final Snuff snuff;
  final int amount;
  const PodiumWidget(
      {required this.position, required this.snuff, required this.amount});

  static const usedStyle = TextStyle(
    color: AppColors.textPrimary2,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
  );

  @override
  Widget build(BuildContext context) {
    var color = (position == 1)
        ? AppColors.goldPlace
        : (position == 2)
            ? AppColors.silverPlace
            : AppColors.bronzePlace;
    var secondColor = (position == 1)
        ? AppColors.goldStamped
        : (position == 2)
            ? AppColors.silverStamped
            : AppColors.bronzeStamped;

    var podiumHeight = (position == 1)
        ? 140.0
        : (position == 2)
            ? 100.0
            : 60.0;
    var numberHash = (position == 1)
        ? '#1'
        : (position == 2)
            ? '#2'
            : '#3';
    var numberSizedbox = (position == 1)
        ? 12.0
        : (position == 2)
            ? 10.0
            : 4.0;
    var numberTextHeight = (position == 1 || position == 2) ? 28.0 : 4.0;

    var fromTop = (position == 1)
        ? 10.0
        : (position == 2)
            ? 40.0
            : 80.0;
    var secondFromTop = (position == 1)
        ? 10.0
        : (position == 2)
            ? 20.0
            : 20.0;

    return Column(children: [
      Padding(
        padding: EdgeInsets.only(top: fromTop),
        child: Image.asset(AppSnuffs.images[snuff.ImageUrl] ?? '',
            width: 80, height: 80),
      ),
      Padding(
        padding: EdgeInsets.only(top: secondFromTop),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            border: Border.fromBorderSide(BorderSide(color: color, width: 2.0)),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0), topRight: Radius.circular(0)),
            boxShadow: [
              BoxShadow(
                  color: color,
                  spreadRadius: 0,
                  blurRadius: 0,
                  offset: Offset(0, 3))
            ],
          ),
          child: Container(
            width: 82,
            height: podiumHeight,
            child: Column(children: [
              SizedBox(height: numberTextHeight),
              Text(
                numberHash,
                style: TextStyle(
                  fontSize: 20,
                  color: secondColor,
                  shadows: [
                    Shadow(
                      offset:
                          Offset(1.0, 1.0), // Lätt förskjuten skugga ger djup
                      blurRadius:
                          2.0, // En liten suddighet för realism // Halvtransparent svart för mjuk skugga
                    ),
                  ],
                ),
              ),
              SizedBox(height: numberSizedbox),
              Text(
                amount.toString(),
                style: usedStyle,
              ),
            ]),
          ),
        ),
      )
    ]);
  }
}
