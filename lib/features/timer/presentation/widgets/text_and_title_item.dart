import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utlis/styles.dart';

class TextAndTitleItem extends StatelessWidget {
  const TextAndTitleItem({
    required this.title,
    required this.subTitle,
    required this.totalTime,
    required this.isHome,
    super.key,
  });
  final String title, subTitle;
  final String totalTime;
  final bool isHome;
  @override
  Widget build(BuildContext context) {
    String displayText =
        title.length > 20.w ? '${title.substring(0, 20.w.toInt())}...' : title;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isHome
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("$displayText ",
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textSemiBold16.copyWith(
                        color: const Color(0xff2F3138),
                      )),
                  SizedBox(height: 5.h),
                  Text("for $totalTime minutes ", style: Styles.textMedium10),
                ],
              )
            : Text(displayText,
                overflow: TextOverflow.ellipsis,
                style: Styles.textMedium12.copyWith(
                  color: const Color(0xff2F3138),
                )),
        Text(
            isHome
                ? "start at $subTitle"
                : "$subTitle/${(int.parse(totalTime) ~/ 60).toString()} min",
            style: Styles.textMedium10)
      ],
    );
  }
}
