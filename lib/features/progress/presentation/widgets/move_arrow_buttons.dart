

import 'package:flutter/material.dart';

class MoveArrowButtons extends StatelessWidget {
  const MoveArrowButtons({super.key, required this.onQlick,required this.onQlick2});
  final void  Function() onQlick ;
  final void  Function() onQlick2 ;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: onQlick, icon: const Icon(Icons.navigate_before,size: 40,)),
        IconButton(onPressed: onQlick2, icon: const Icon(Icons.navigate_next,size: 40,))
      ],
    );
  }
}
