

import 'package:flutter/material.dart';

class ColorAndTypeWidget extends StatefulWidget {
  const ColorAndTypeWidget({super.key});

  @override
  State<ColorAndTypeWidget> createState() => _ColorAndTypeWidgetState();
}

class _ColorAndTypeWidgetState extends State<ColorAndTypeWidget> {

  Color selectedColor = Colors.green; // Default color
  IconData selectedIcon = Icons.accessibility_new;

  // Function to show a color picker
  void _showColorPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
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
                child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.red),
                  margin: const EdgeInsets.all(10),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColor = Colors.green;
                  });
                  Navigator.pop(context);
                },
                child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green),
                    margin: const EdgeInsets.all(10)),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColor = Colors.blue;
                  });
                  Navigator.pop(context);
                },
                child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
                    margin: const EdgeInsets.all(10)),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColor = Colors.purple;
                  });
                  Navigator.pop(context);
                },
                child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.purple),
                    margin: const EdgeInsets.all(10)),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColor = Colors.black;
                  });
                  Navigator.pop(context);
                },
                child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black),
                    margin: const EdgeInsets.all(10)),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColor = Colors.cyanAccent;
                  });
                  Navigator.pop(context);
                },
                child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.cyanAccent),
                    margin: const EdgeInsets.all(10)),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColor = Colors.brown;
                  });
                  Navigator.pop(context);
                },
                child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.brown),
                    margin: const EdgeInsets.all(10)),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColor = Colors.amber;
                  });
                  Navigator.pop(context);
                },
                child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.amber),
                    margin: const EdgeInsets.all(10)),
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
        return SizedBox(
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
                child: const Icon(Icons.accessibility_new, size: 40),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIcon = Icons.book;
                  });
                  Navigator.pop(context);
                },
                child: const Icon(Icons.book, size: 40),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIcon = Icons.add_card;
                  });
                  Navigator.pop(context);
                },
                child: const Icon(Icons.add_card, size: 40),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIcon = Icons.add_a_photo;
                  });
                  Navigator.pop(context);
                },
                child: const Icon(Icons.add_a_photo, size: 40),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIcon = Icons.local_drink;
                  });
                  Navigator.pop(context);
                },
                child: const Icon(Icons.local_drink, size: 40),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIcon = Icons.fitness_center;
                  });
                  Navigator.pop(context);
                },
                child: const Icon(Icons.fitness_center, size: 40),
              ),
              // Add more icons as needed
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          flex: 5,
          child: ElevatedButton(
            onPressed: _showColorPicker,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white70,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ), // Trigger color picker
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 20, // Width of the container
                  height: 20, // Height of the container
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // Make the container circular
                    color:
                    selectedColor, // Set the color of the container
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text('Color'),
              ],
            ),
          ),
        ),
        const Expanded(child: SizedBox()),
        Expanded(
          flex:5 ,
          child: ElevatedButton(
            onPressed: _showIconPicker,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white70,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ), // Trigger icon picker
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(selectedIcon),
                const SizedBox(width: 10,),
                const Text('Icon'),
              ],
            ),
          ),
        ),

      ],
    );
  }
}
