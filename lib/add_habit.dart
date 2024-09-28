import 'package:flutter/material.dart';



class CreateCustomHabit extends StatefulWidget {
  @override
  _CreateCustomHabitState createState() => _CreateCustomHabitState();
}

class _CreateCustomHabitState extends State<CreateCustomHabit> {
  Color selectedColor = Colors.green; // Default color
  IconData selectedIcon = Icons.accessibility_new; // Default icon

  String frequency = 'Every day';
  String repeats = '1 time per day';
  String timer = '30 min';
  String reminder = '4:50 pm';

  // Function to show a color picker
  void _showColorPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 100,
          child: GridView.count(
            crossAxisCount: 8,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColor = Colors.red;
                  });
                  Navigator.pop(context);
                },
                child: Container(decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.red) ,margin: EdgeInsets.all(10),),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColor = Colors.green;
                  });
                  Navigator.pop(context);
                },
                child: Container(decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.green), margin: EdgeInsets.all(10)),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColor = Colors.blue;
                  });
                  Navigator.pop(context);
                },
                child: Container(decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.blue), margin: EdgeInsets.all(10)),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColor = Colors.purple;
                  });
                  Navigator.pop(context);
                },
                child: Container(decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.purple), margin: EdgeInsets.all(10)),
              ), GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColor = Colors.black;
                  });
                  Navigator.pop(context);
                },
                child: Container(decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black), margin: EdgeInsets.all(10)),
              ), GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColor = Colors.cyanAccent;
                  });
                  Navigator.pop(context);
                },
                child: Container(decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.cyanAccent), margin: EdgeInsets.all(10)),
              ), GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColor = Colors.brown;
                  });
                  Navigator.pop(context);
                },
                child: Container(decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.brown), margin: EdgeInsets.all(10)),
              ), GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColor = Colors.amber;
                  });
                  Navigator.pop(context);
                },
                child: Container(decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.amber), margin: EdgeInsets.all(10)),
              ),
              // Add more color options as needed
            ],
          ),
        );
      },
    );
  }

  // Function to show an icon picker
  void _showIconPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 150,
          child: GridView.count(
            crossAxisCount: 6,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIcon = Icons.accessibility_new;
                  });
                  Navigator.pop(context);
                },
                child: Icon(Icons.accessibility_new, size: 40),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIcon = Icons.book;
                  });
                  Navigator.pop(context);
                },
                child: Icon(Icons.book, size: 40),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIcon = Icons.add_card;
                  });
                  Navigator.pop(context);
                },
                child: Icon(Icons.add_card, size: 40),
              ),GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIcon = Icons.add_a_photo;
                  });
                  Navigator.pop(context);
                },
                child: Icon(Icons.add_a_photo, size: 40),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIcon = Icons.local_drink;
                  });
                  Navigator.pop(context);
                },
                child: Icon(Icons.local_drink, size: 40),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIcon = Icons.fitness_center;
                  });
                  Navigator.pop(context);
                },
                child: Icon(Icons.fitness_center, size: 40),
              ),
              // Add more icons as needed
            ],
          ),
        );
      },
    );
  }

  // Function to show settings options
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
        return Container(
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
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Create custom habit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What do you want to do?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Name of habit',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(

              children: [
                Flexible(
                  flex: 1,
                  child: ElevatedButton(

                    onPressed: _showColorPicker, // Trigger color picker
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Container(
                      width: 20,  // Width of the container
                      height: 20, // Height of the container
                      decoration: BoxDecoration(
                        shape: BoxShape.circle, // Make the container circular
                        color: selectedColor, // Set the color of the container
                      ),
                      ),
                        SizedBox(width: 20,),

                        Text('Color'),
                      ],
                    ),

                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Colors.white70,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Flexible(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: _showIconPicker, // Trigger icon picker
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(selectedIcon),
                        SizedBox(width: 10,),
                        Text('Icon'),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Colors.white70,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              'Settings',
              style: TextStyle( fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            settingOption(

              title: 'Frequency',
              value: frequency,
              onTap: () {
                _showSettingsOptions('Frequency');
              },
            ),
            settingOption(
              title: 'Repeats',
              value: repeats,
              onTap: () {
                _showSettingsOptions('Repeats');
              },
            ),
            settingOption(
              title: 'Timer',
              value: timer,
              onTap: () {
                _showSettingsOptions('Timer');
              },
            ),
            settingOption(
              title: 'Reminders',
              value: reminder,
              onTap: () {
                _showSettingsOptions('Reminders');
              },
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Action for Continue button
              },
              child: Center(child: Text('Continue')),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget settingOption({
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 10),
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(value, style: TextStyle(color: Colors.grey)),
          Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
      onTap: onTap,
    );
  }
}
