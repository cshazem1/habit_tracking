import 'package:flutter/material.dart';

import '../../../core/utlis/styles.dart';

class TimerViews extends StatelessWidget {
  const TimerViews({super.key,required this.nameAppBar});
final String nameAppBar;
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar:  AppBar(
        title:  Text(nameAppBar,style:Styles.textMedium10),
      ),
    );
  }
}
