import 'package:flutter/material.dart';
import '../../../../core/utlis/styles.dart';

class LabelBtn extends StatelessWidget {
  const LabelBtn( {super.key, required this.label, required this.onClick });
final String label;
  final void Function()? onClick;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: onClick,
        child: Text(
          label,
          style: Styles.textMedium16.copyWith(
            color: const Color(0xff5F6CE2),
          ),
        ),
      ),
    );
  }
}
