import 'package:flutter/material.dart';
import 'package:snusyoulooseflutter/Styles/app_colors.dart';

import '../Config/app_media.dart';
import '../Model/Snuff.dart';

class ConsumedWidget extends StatefulWidget {
  final List<Snuff> snuffs;
  final List<int> amounts;
  final VoidCallback onExit;
  ConsumedWidget(
      {required this.snuffs, required this.amounts, required this.onExit});

  @override
  State<ConsumedWidget> createState() => _ConsumedWidgetState();
}

class _ConsumedWidgetState extends State<ConsumedWidget> {
  @override
  Widget build(BuildContext context) {
    print("CONSUMED WIDGET");
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Positioned(
            child: IconButton(
              onPressed: widget.onExit,
              icon: Icon(Icons.arrow_back),
              iconSize: 40,
              color: AppColors.example2,
            ),
            top: 20,
            left: 20,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(29.5, 40, 8, 0),
            child: Column(children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.86,
                decoration: BoxDecoration(
                  color: AppColors.example2,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: List.generate(
                    widget.snuffs.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Row(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    AppSnuffs.images[
                                        widget.snuffs[index].ImageUrl!]!,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.snuffs[index].Brand,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Amount: ${widget.amounts[index]}',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
