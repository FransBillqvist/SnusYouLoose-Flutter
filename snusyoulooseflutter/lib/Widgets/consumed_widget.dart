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
  bool isBrandAsc = true;

  @override
  Widget build(BuildContext context) {
    print("CONSUMED WIDGET");
    return Material(
      color: Colors.white.withOpacity(0.1),
      child: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 20,
              left: 20,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close),
                iconSize: 40,
                color: AppColors.example2,
              ),
            ),
            Positioned(
              top: 22,
              left: 60,
              child: IconButton(
                iconSize: 32,
                icon: Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    Icon(
                      Icons.abc,
                      color: AppColors.example2,
                    ),
                    Positioned(
                      left: 34,
                      child: Icon(isBrandAsc
                          ? Icons.arrow_upward
                          : Icons.arrow_downward),
                    ),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    isBrandAsc = !isBrandAsc;
                    widget.snuffs.sort((a, b) => isBrandAsc
                        ? a.Brand.compareTo(b.Brand)
                        : b.Brand.compareTo(a.Brand));
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(29.5, 80, 8, 0),
              child: Column(children: [
                Container(
                  constraints:
                      BoxConstraints(maxHeight: 725), // Set max height here
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
                  child: ListView(
                    shrinkWrap: true,
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
                                padding: const EdgeInsets.fromLTRB(10, 4, 0, 2),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.snuffs[index].Brand,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      widget.snuffs[index].Type,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white70,
                                      ),
                                    ),
                                    Text(
                                      'Amount: ${widget.amounts[index]}',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white70,
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
      ),
    );
  }
}
