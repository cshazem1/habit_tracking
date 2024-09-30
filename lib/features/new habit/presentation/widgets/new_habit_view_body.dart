

import 'package:flutter/material.dart';
import 'package:habit_tracking/core/utlis/styles.dart';
import 'package:habit_tracking/features/new%20habit/presentation/widgets/setting_options_widget.dart';

import 'color_and_type_widget.dart';
import 'habit_text_field.dart';


class NewHabitViewBody extends StatelessWidget {
   NewHabitViewBody({super.key});

  String frequency = 'Every day';
  String repeats = '1 time per day';
  String timer = '30 min';
  String reminder = '4:50 pm';
   TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text
                  ('What do you want to do?',style: Styles.textSemiBold16,
                ),
                const SizedBox(height: 5),
                 HabitTextField(
                  habitController: controller,
                ),
                const SizedBox(height: 16),
                const ColorAndTypeWidget(),
                const SizedBox(height: 24),
                const Text('Settings', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                const SizedBox(height: 8),
                const SettingOptionsWidget(),
                SizedBox(height: MediaQuery.of(context).size.height *0.1,),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff5F6CE2),
                    padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Center(child: Text('Continue',style: TextStyle(color:Colors.white ),)),
                ),



              ],

            )));
  }
}
