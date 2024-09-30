

import 'package:flutter/material.dart';

import 'setting_options.dart';

class SettingOptionsWidget extends StatefulWidget {
  const SettingOptionsWidget({super.key});

  @override
  State<SettingOptionsWidget> createState() => _SettingOptionsWidgetState();
}

class _SettingOptionsWidgetState extends State<SettingOptionsWidget> {
  String frequency = 'Every day';
  String repeats = '1 time per day';
  String timer = '30 min';
  String reminder = '4:50 pm';
  void _showSettingsOptions(String settingType) {
    List<String> options = [];
    if (settingType == 'Frequency') {
      options = ['Every day', 'Every week', 'Every month'];
    } else if (settingType == 'Repeats') {
      options = ['1 time per day', '2 times per day', '3 times per day'];
    } else if (settingType == 'Timer') {
      options = ['10 min', '20 min', '30 min', '1 hour'];
    } else if (settingType == 'Reminders') {
      options = ['4:50 pm', '5:00 pm', '6:00 pm', '7:00 pm'];
    }

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: options.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(options[index]),
                onTap: () {
                  setState(() {
                    if (settingType == 'Frequency') {
                      frequency = options[index];
                    } else if (settingType == 'Repeats') {
                      repeats = options[index];
                    } else if (settingType == 'Timer') {
                      timer = options[index];
                    } else if (settingType == 'Reminders') {
                      reminder = options[index];
                    }
                  });
                  Navigator.pop(context);
                },
              );
            },
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SettingOptions(
          title: 'Frequency',
          value: frequency,
          onTap: () {
            _showSettingsOptions('Frequency');
          },
        ),
        SettingOptions(
          title: 'Repeats',
          value: repeats,
          onTap: () {
            _showSettingsOptions('Repeats');
          },
        ),
        SettingOptions(
          title: 'Timer',
          value: timer,
          onTap: () {
            _showSettingsOptions('Timer');
          },
        ),
        SettingOptions(
          title: 'Reminders',
          value: reminder,
          onTap: () {
            _showSettingsOptions('Reminders');
          },
        ),

      ],

    );
  }
}
