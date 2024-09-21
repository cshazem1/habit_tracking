import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCircleButton extends StatelessWidget {
  const CustomCircleButton({
    required this.size,
    required this.color,
    required this.icon,
    this.onTap,
    super.key,
  });

  final Color color;
  final double size;
  final Icon icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.w,
        height: size.w,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        child: icon,
      ),
    );
  }
}
