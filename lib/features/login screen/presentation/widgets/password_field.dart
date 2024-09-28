import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracking/core/utlis/styles.dart';

class PasswordField extends StatelessWidget {
  const PasswordField(
      {super.key, required this.hintLabel, required this.label, required this.helperText});
  final String hintLabel, label,helperText;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
    child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: Styles.textMedium16.copyWith(
              color: const Color(0xff2F3138),
            )),
        const SizedBox(
          height: 8,
        ),
        TextField(
          decoration: InputDecoration(
            hintStyle: const TextStyle(
              color: Color(0xffABAEBA),
              fontSize: 13,
              fontWeight: FontWeight.w400,
              fontFamily: 'Montserrat',
            ),
            hintText: hintLabel,
            helperText: helperText,
            helperStyle: const TextStyle(
              color: Color(0xff7C84A3),
              fontSize: 10,
              fontWeight: FontWeight.w400,
              fontFamily: 'Montserrat',
            ),
            suffixIcon: const Icon(
              Icons.visibility_off_outlined,
              size: 24,
              color: Color(0xffABAEBA),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xffABAEBA),width: 2,),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff5F6CE2),width: 2),
            ),

          ),
        )
      ],
    ),
    );
  }
}
