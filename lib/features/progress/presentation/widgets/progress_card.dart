


import 'package:flutter/material.dart';
import 'package:habit_tracking/core/utlis/styles.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key, required this.num, required this.title});
  final String num;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height *0.1,
      width: MediaQuery.of(context).size.width*0.4,
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
       color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(num ,style: Styles.textSemiBold20,),
          Text(title,style: Styles.textMedium12,)
        ],
      ),
    );
  }
}
