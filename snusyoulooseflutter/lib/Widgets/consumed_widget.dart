import 'package:flutter/material.dart';
import 'package:snusyoulooseflutter/Styles/app_colors.dart';

import '../Model/Snuff.dart';

class ConsumedWidget extends StatefulWidget {
  List<Snuff> snuffs;
  List<int> amounts;
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
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(29.5, 40, 8, 0),
          child: Column(
            children: [
              Container(
                height: 92.0 * widget.snuffs.length,
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
                child: ListView.builder(
                  itemCount: widget.snuffs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Row(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image:
                                    AssetImage(widget.snuffs[index].ImageUrl),
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
              )
            ],
          ),
        ),
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
      ],
    );
  }
}
