import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utlis/styles.dart';
import '../manager/timer_cubit/timer_cubit.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(isHome ? "${"${title}for$totalTime"} minutes" : title,
            style: Styles.textMedium12.copyWith(
              color: const Color(0xff2F3138),
            )),
        Text(
            "${isHome ? "start at $subTitle" : subTitle + "/${(int.parse(totalTime) ~/ 60).toString()} min"}",
            style: Styles.textMedium10.copyWith(
              color: const Color(0xff7C84A3),
            ))
      ],
    );
  }
}
