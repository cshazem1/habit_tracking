import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracking/core/utlis/styles.dart';
import 'package:habit_tracking/features/new%20habit/Data/model/habit_view_model.dart';
import 'package:provider/provider.dart';
import 'custom_data_time_line.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HabitViewModel>(context);
    final habitsList = viewModel.habits;
    return Padding(
      padding: EdgeInsets.only(left: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          const DataTimeLine(),
          SizedBox(
            height: 40.h,
          ),
          const Text(
            "Today",
            style: Styles.textSemiBold20,
          ),
          const SizedBox(height: 20,),
          Expanded(
            child: habitsList.isEmpty ?
            const Center(child: Text("There is no Habits yet! " ,style: Styles.textSemiBold16,)) :
            ListView.builder(
                itemCount: habitsList.length,
                itemBuilder: (context, index) {
                  final habit = habitsList[index];
                  return ListTile(
                    leading: Image.asset(habit.habitIcon ,scale: 2,),
                    title: Text(habit.habitName),
                    subtitle: Text("Timer: ${habit.timer}  min   \n Reminder: ${habit.reminder}"),
                    trailing: Container(
                      width: 20,
                      height: 20,
                      color: Color(habit.habitColor),
                    ),

                  );
                  // return Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       Navigator.pushNamed(context, AppRoutes.timer);
                  //
                  //       // print("object");
                  //     },
                  //     child: CustomItem(
                  //       isHome: true,
                  //       itemModel: ItemModel(
                  //           title: "Read a book ",
                  //           subTitle: " 9:30 am",
                  //           image: Assets.imagesBagDynamicColor,
                  //           totalTime: "10"), ),
                  //   ),
                  // );
                }),
          ),


        ],
      ),
    );
  }
}
