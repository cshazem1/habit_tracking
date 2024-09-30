


import 'package:flutter/material.dart';

class SettingOptions extends StatelessWidget {
  const SettingOptions({super.key, required this.title, required this.value, required this.onTap});

  final String title;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 10),
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(value, style: const TextStyle(color: Colors.grey)),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
      onTap: onTap,
    );

  }
}
