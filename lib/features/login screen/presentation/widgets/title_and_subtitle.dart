import 'package:flutter/cupertino.dart';

import '../../../../core/utlis/image_strings.dart';
import '../../../../core/utlis/styles.dart';
import '../../../../core/utlis/text_string.dart';

class TitleAndSubtitle extends StatelessWidget {
  TitleAndSubtitle({super.key, required this.title, required this.subTitle});
  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,32,0,32),
      child: Column(
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                style: Styles.textSemiBold24.copyWith(color: const Color(0xff2F3138)),
                textAlign: TextAlign.start,
              ),

              const SizedBox(height: 24,
              ),

              Text(subTitle,
                style: Styles.textMedium14.copyWith(color: const Color(0xff7C84A3)),
                textAlign: TextAlign.left,
              ),
            ],
          )
        ],
      ),
    );
  }
}
