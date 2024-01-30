import 'package:flutter/material.dart';

import '../Model/CreateCSDto.dart';

class CartWidget extends StatefulWidget {
  final List<CreateCSDto> cartState;
  final VoidCallback onExit;
  CartWidget({required this.cartState, required this.onExit});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Padding(
        padding: const EdgeInsets.fromLTRB(29.5, 40, 8, 0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.95,
          width: MediaQuery.of(context).size.width * 0.86,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
          ),
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
    ]);
  }
}
