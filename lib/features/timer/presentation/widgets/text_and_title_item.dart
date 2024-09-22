import 'package:flutter/material.dart';

import '../../../../core/utlis/styles.dart';

class TextAndTitleItem extends StatelessWidget {
  const TextAndTitleItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Meditate for 30 minutes",
            style: Styles.textMedium12.copyWith(
              color: const Color(0xff2F3138),
            )),
        Text("0/30 minute ",
            style: Styles.textMedium10.copyWith(
              color: const Color(0xff7C84A3),
            ))
      ],
    );
  }
}
