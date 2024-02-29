import 'package:flutter/material.dart';
import 'dart:math' as math;

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
    fontSize: 28,
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
        ? 170.0
        : (position == 2)
            ? 130.0
            : 90.0;
    var numberHash = (position == 1)
        ? '#1'
        : (position == 2)
            ? '#2'
            : '#3';
    var numberSizedbox = (position == 1)
        ? 16.0
        : (position == 2)
            ? 11.0
            : 4.0;
    var numberTextHeight = (position == 1)
        ? 22.0
        : (position == 2)
            ? 14.0
            : 0.0;

    var fromTop = (position == 1)
        ? 10.0
        : (position == 2)
            ? 40.0
            : 80.0;
    var secondFromTop = (position == 1)
        ? 10.0
        : (position == 2)
            ? 20.0
            : 10.0;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: fromTop),
          child: Image.asset(AppSnuffs.images[snuff.ImageUrl] ?? '',
              width: 80, height: 80),
        ),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // Sidan av podiet
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..rotateX(0.1)
                ..rotateY(0.5), // Exempel på rotation
              child: Container(
                width: 82,
                height: podiumHeight,
                color: color,
              ),
            ),
            // Toppen av podiet
            Container(
              width: 90,
              height: 10,
              decoration: BoxDecoration(
                color: secondColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
            ),
            // Plattformen på podiet
            Transform.translate(
              offset:
                  Offset(0, -10), // Justera positionen baserat på ditt layout
              child: Container(
                width: 88,
                height: 5,
                decoration: BoxDecoration(
                  color: color,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),
            // Nummer och antal
            Positioned(
              top:
                  secondFromTop, // Använd 'secondFromTop' för att justera positionen vertikalt
              child: Column(
                children: [
                  SizedBox(height: numberTextHeight),
                  Text(
                    numberHash,
                    style: TextStyle(
                      fontSize:
                          20, // Du kanske vill justera storleken baserat på 'position'
                      color: secondColor, // Justera färgen om det behövs
                      shadows: [
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 2.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: numberSizedbox),
                  Text(
                    amount.toString(),
                    style: TextStyle(
                      fontSize:
                          28, // Använd 'usedStyle' om du vill behålla stilen som definierats tidigare
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
