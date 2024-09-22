import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/assets.dart';

class CustomIconItem extends StatelessWidget {
  const CustomIconItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xffFFC7F9),
      ),
      child: Image.asset(
        Assets.imagesBagDynamicColor,
        width: 32.w,
        height: 32.h,
      ),
    );
  }
}
