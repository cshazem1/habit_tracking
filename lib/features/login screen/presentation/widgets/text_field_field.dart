import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utlis/styles.dart';

class TextFieldField extends StatelessWidget {
  const TextFieldField({
    super.key,
    required this.hintLabel,
    required this.label,
    required this.validator,
    required this.controller,
  });

  final String hintLabel;
  final String label;
  final String? Function(String?) validator; // Correctly types the validator
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16), // Simplified padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Styles.textMedium16.copyWith(
              color: const Color(0xff2F3138),
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintStyle: const TextStyle(
                color: Color(0xffABAEBA),
                fontSize: 13,
                fontWeight: FontWeight.w400,
                fontFamily: 'Montserrat',
              ),
              hintText: hintLabel,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xffABAEBA),
                  width: 2,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff5F6CE2), width: 2),
              ),
            ),
            validator: validator, // Use the passed validator
          ),
        ],
      ),
    );
  }
}
