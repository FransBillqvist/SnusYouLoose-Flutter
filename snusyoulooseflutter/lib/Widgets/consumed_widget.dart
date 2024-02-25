import 'package:flutter/material.dart';

import '../Model/Snuff.dart';

class MyWidget extends StatefulWidget {
  List<Snuff> snuffs;
  List<int> amounts;
  final VoidCallback onExit;
  MyWidget({required this.snuffs, required this.amounts, required this.onExit});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(29.5, 40, 8, 0),
          child: Container(
            height: 92.0 * widget.snuffs.length,
            width: MediaQuery.of(context).size.width * 0.86,
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
