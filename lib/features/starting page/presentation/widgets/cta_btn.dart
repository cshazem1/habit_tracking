import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utlis/styles.dart';

class CtaBtn extends StatelessWidget {
  const CtaBtn({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: SizedBox(
        height: 48,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: const Color(0xff5F6CE2),
          ),
          child: Text(label,
              style: Styles.textMedium16.copyWith(
                color: const Color(0xffFFFFFF),
              )),
        ),
      ),
    );
  }
}
