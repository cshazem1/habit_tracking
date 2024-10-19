import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracking/core/utlis/styles.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.hintLabel,
    required this.label,
    required this.helperText,
    required this.obsecure,
    this.controller,
    this.validate,
  });

  final String hintLabel, label, helperText;
  final bool obsecure;
  final TextEditingController? controller;
  final String? Function(String?)? validate;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obsecure;
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: Styles.textMedium16.copyWith(
              color: const Color(0xff2F3138),
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            obscureText: _obscureText,
            validator: widget.validate,
            controller: widget.controller,
            decoration: InputDecoration(
              hintStyle: const TextStyle(
                color: Color(0xffABAEBA),
                fontSize: 13,
                fontWeight: FontWeight.w400,
                fontFamily: 'Montserrat',
              ),
              hintText: widget.hintLabel,
              helperText: widget.helperText,
              helperStyle: const TextStyle(
                color: Color(0xff7C84A3),
                fontSize: 10,
                fontWeight: FontWeight.w400,
                fontFamily: 'Montserrat',
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility,
                  size: 24,
                  color: const Color(0xffABAEBA),
                ),
                onPressed: _toggleVisibility,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xffABAEBA),
                  width: 2,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff5F6CE2),
                  width: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
