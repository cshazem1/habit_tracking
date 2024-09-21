import 'package:flutter/material.dart';

import '../../../core/utlis/styles.dart';

class TimerViews extends StatelessWidget {
  const TimerViews({super.key, required this.nameAppBar});
  final String nameAppBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nameAppBar, style: Styles.textSemiBold16),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xffF8F8F8)),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffFFC7F9)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
