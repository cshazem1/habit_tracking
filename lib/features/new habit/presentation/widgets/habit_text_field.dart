


import 'package:flutter/material.dart';

class HabitTextField extends StatelessWidget {
  const HabitTextField({super.key, required this.habitController});

  final TextEditingController habitController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: habitController,
      decoration: InputDecoration(
        hintText: 'Name of habit',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
