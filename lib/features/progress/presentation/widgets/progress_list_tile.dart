

import 'package:flutter/material.dart';
import 'package:habit_tracking/core/utlis/styles.dart';
import 'package:habit_tracking/features/progress/presentation/widgets/move_arrow_buttons.dart';

class ProgressListTile extends StatelessWidget {
  const ProgressListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("This week",style: Styles.textSemiBold20,),
              Text("Dec 21 - Dec 27" , style: Styles.textMedium14grey,)
            ],

          ),
          MoveArrowButtons(onQlick: (){}, onQlick2: (){})

        ],
      ),
    );
  }
}
