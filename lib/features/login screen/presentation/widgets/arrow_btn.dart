import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArrowBtn extends StatelessWidget {
  const ArrowBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.arrow_back,
          size: 32,
          color: Color(0xff2F3138),
        ));
  }
}
