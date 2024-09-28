import 'package:flutter/material.dart';

class TimePeriodButton extends StatelessWidget {
  const TimePeriodButton(
      {super.key, required this.buttonText, required this.onPressed, required this.buttonStyle});
  final String buttonText;
  final void Function() onPressed;
  final ButtonStyle buttonStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      onPressed: onPressed,
      child: Text(buttonText),
    );
  }
}
