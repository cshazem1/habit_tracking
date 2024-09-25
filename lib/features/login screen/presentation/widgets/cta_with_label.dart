import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utlis/styles.dart';

class CtaWithLabel extends StatelessWidget {
  const CtaWithLabel({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Center(
        child: SizedBox(
          height: 48,
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.g_mobiledata_rounded,
              size: 32,
              color: Color(0xff5F6CE2), // Icon color
            ),
            label: Text(label,
                style: Styles.textMedium16.copyWith(
                  color: const Color(0xff5F6CE2),
                )),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                color: Color(0xff5F6CE2), // Border color
                width: 2.0, // Border width
              ),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(12.0), // Optional: rounded corners
              ),
            ),
          ),
        ),
      ),
    );
  }
}
