import 'package:flutter/material.dart';
import 'package:habit_tracking/core/utlis/styles.dart';
import 'package:habit_tracking/features/home/presentation/manager/home_cubit.dart';
import 'package:habit_tracking/features/new%20habit/Data/model/habit_view_model.dart';
import 'package:habit_tracking/features/new%20habit/Data/model/habits_final_model.dart';
import 'package:habit_tracking/features/progress/presentation/controller/weekly_progress_cubit.dart';
import 'package:habit_tracking/generated/assets.dart';
import 'package:provider/provider.dart';

import '../../../../core/routes/app_routes.dart';

class CreateCustomHabit extends StatefulWidget {
  CreateCustomHabit({super.key, this.index, this.habits});
  final HabitFinalModel? habits;
  final int? index;
  TextEditingController? controller;

  @override
  State<CreateCustomHabit> createState() => _CreateCustomHabitState();
}
class _CreateCustomHabitState extends State<CreateCustomHabit> {
  @override
  void initState() {
    widget.controller = TextEditingController(text: widget.habits?.habitName);

    super.initState();
  }
  @override
  void dispose() {
    widget.controller?.dispose();  // Dispose of the controller when done
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {


    final viewModel = Provider.of<HabitViewModel>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What do you want to do?',
              style: Styles.textSemiBold16,
            ),
            const SizedBox(height: 5),
            TextField(
              controller: widget.controller,
              maxLines: 4,
              minLines: 1,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.note),
                hintText: 'Name of habit',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: viewModel.setHabitName,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: ElevatedButton(
                    onPressed: () => _showColorPicker(context, viewModel),
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
                            shape: BoxShape.circle,
                            // Make the container circular
                            color: Color(viewModel
                                .selectedColor), // Set the color of the container
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
                  flex: 5,
                  child: ElevatedButton(
                    onPressed: () => _showIconPicker(context, viewModel),
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
                        Image.asset(
                          viewModel.selectedIcon,
                          scale: 1.5,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Icon'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const Text(
              'Settings',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            settingOption(
              title: 'Timer',
              value: viewModel.selectedTimer,
              onTap: () {
                _showSettingsOptions(context, viewModel);
              },
            ),
            settingOption(
              title: 'Reminders',
              value: viewModel.reminder.toString(),
              onTap: () {
                _pickReminderTime(context, viewModel);
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            ElevatedButton(
              onPressed: () {

                if (widget.habits != null) {
                  viewModel.editHabit(
                      HomeCubit.get(context).userSelectedDate ?? DateTime.now(),
                      widget.index ?? 0);
                  HomeCubit.get(context).refresh();
                }
                else {
                  viewModel.addHabit(
                    HomeCubit.get(context).userSelectedDate ?? DateTime.now());
                  HomeCubit.get(context).refresh();

                }

                Navigator.pushReplacementNamed(context, AppRoutes.home);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff5F6CE2),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Center(
                  child: Text(
                'Continue',
                style: TextStyle(color: Colors.white),
              )),
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
      contentPadding: const EdgeInsets.symmetric(vertical: 10),
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(value, style: const TextStyle(color: Colors.grey, fontSize: 16)),
          const Icon(Icons.arrow_forward_ios, size: 20),
        ],
      ),
      onTap: onTap,
    );
  }

  // Function to show a color picker
  void _showColorPicker(BuildContext context, HabitViewModel viewModel) {
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
                  viewModel.setHabitColor(Colors.red.value);
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
                  viewModel.setHabitColor(Colors.green.value);
                  Navigator.pop(context);
                },
                child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green),
                    margin: const EdgeInsets.all(10)),
              ),
              GestureDetector(
                onTap: () {
                  viewModel.setHabitColor(Colors.blue.value);
                  Navigator.pop(context);
                },
                child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
                    margin: const EdgeInsets.all(10)),
              ),
              GestureDetector(
                onTap: () {
                  viewModel.setHabitColor(Colors.purple.value);
                  Navigator.pop(context);
                },
                child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.purple),
                    margin: const EdgeInsets.all(10)),
              ),
              GestureDetector(
                onTap: () {
                  viewModel.setHabitColor(Colors.amberAccent.value);
                  Navigator.pop(context);
                },
                child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.amberAccent),
                    margin: const EdgeInsets.all(10)),
              ),
              GestureDetector(
                onTap: () {
                  viewModel.setHabitColor(Colors.cyanAccent.value);
                  Navigator.pop(context);
                },
                child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.cyanAccent),
                    margin: const EdgeInsets.all(10)),
              ),
              GestureDetector(
                onTap: () {
                  viewModel.setHabitColor(Colors.deepOrangeAccent.value);
                  Navigator.pop(context);
                },
                child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.deepOrangeAccent),
                    margin: const EdgeInsets.all(10)),
              ),
              GestureDetector(
                onTap: () {
                  viewModel.setHabitColor(Colors.deepPurpleAccent.value);
                  Navigator.pop(context);
                },
                child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.deepPurpleAccent),
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
  void _showIconPicker(BuildContext context, HabitViewModel viewModel) {
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
                  viewModel.setHabitIcon(Assets.imagesBoyDynamicColor);
                  Navigator.pop(context);
                },
                child: Image.asset(Assets.imagesBoyDynamicColor),
              ),
              GestureDetector(
                onTap: () {
                  viewModel.setHabitIcon(Assets.imagesNotebookDynamicColor);
                  Navigator.pop(context);
                },
                child: Image.asset(Assets.imagesNotebookDynamicColor),
              ),
              GestureDetector(
                onTap: () {
                  viewModel.setHabitIcon(Assets.imagesGiftDynamicColor);
                  Navigator.pop(context);
                },
                child: Image.asset(Assets.imagesGiftDynamicColor),
              ),
              GestureDetector(
                onTap: () {
                  viewModel.setHabitIcon(Assets.imagesTeaCupDynamicColor);
                  Navigator.pop(context);
                },
                child: Image.asset(Assets.imagesTeaCupDynamicColor),
              ),
              GestureDetector(
                onTap: () {
                  viewModel.setHabitIcon(Assets.imagesPaintKitDynamicColor);
                  Navigator.pop(context);
                },
                child: Image.asset(Assets.imagesPaintKitDynamicColor),
              ),
              GestureDetector(
                onTap: () {
                  viewModel.setHabitIcon(Assets.imagesTargetDynamicColor);
                  Navigator.pop(context);
                },
                child: Image.asset(Assets.imagesTargetDynamicColor),
              ),
              // Add more icons as needed
            ],
          ),
        );
      },
    );
  }

  //show time fnc
  void _pickReminderTime(BuildContext context, HabitViewModel viewModel) {
    showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(viewModel.reminder))
        .then((selectedTime) {
      if (selectedTime != null) {
        final now = DateTime.now();
        final reminderTime = DateTime(now.year, now.month, now.day);
        viewModel.setHabitReminder(reminderTime);
      }
    });
  }

  // Function to show settings options
  void _showSettingsOptions(BuildContext context, HabitViewModel viewModel) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: ListView(children: [
            ListTile(
              title: const Text("10 Minutes"),
              onTap: () {
                viewModel.setHabitTimer("10");
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("15 Minutes"),
              onTap: () {
                viewModel.setHabitTimer("15");
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("20 Minutes"),
              onTap: () {
                viewModel.setHabitTimer("20");
                Navigator.pop(context);
              },
            ),
          ]),
        );
      },
    );
  }
}
