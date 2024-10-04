import 'package:flutter/material.dart';

class HabitTextField extends StatelessWidget {
  const HabitTextField(
      {super.key, required this.habitController, this.onSaved});

  final TextEditingController habitController;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      height: MediaQuery.of(context).size.height *0.08,
      child: TextFormField(
        onSaved: onSaved,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return "Add habit name";
          }
        },
        controller: habitController,
        decoration: 
        InputDecoration(
          hintText: 'Name of habit',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        
      ),
    );
  }
}
