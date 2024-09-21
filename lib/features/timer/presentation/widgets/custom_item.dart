import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracking/features/timer/presentation/widgets/text_and_title_item.dart';

import 'custom_icon_item.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xffF8F8F8)),
      child: SizedBox(
        height: 64.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 48.h,
              width: 48.w,
              child: const CustomIconItem(),
            ),
            SizedBox(
              width: 10.w,
            ),
            const TextAndTitleItem()
          ],
        ),
      ),
    );
  }
}
