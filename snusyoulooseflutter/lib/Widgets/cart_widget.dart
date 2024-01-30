import 'package:flutter/material.dart';

import '../Model/CreateCSDto.dart';

class CartWidget extends StatefulWidget {
  final List<CreateCSDto> cartState;
  CartWidget({required this.cartState});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
