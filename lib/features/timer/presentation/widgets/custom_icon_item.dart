import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomIconItem extends StatelessWidget {
  const CustomIconItem({required this.image,
    super.key, required this.color,
  });
final String image;
final int color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color:  Color(color),
      ),
      child: Image.asset(
        image,
        width: 32.w,
        height: 32.h,
      ),
    );
  }
}
