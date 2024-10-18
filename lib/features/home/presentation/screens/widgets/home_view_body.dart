import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracking/core/utlis/styles.dart';
import 'package:habit_tracking/features/home/presentation/manager/home_cubit.dart';
import 'package:habit_tracking/features/new%20habit/Data/model/habit_view_model.dart';
import 'package:habit_tracking/features/new%20habit/Data/model/habits_final_model.dart';
import 'package:provider/provider.dart';
import '../../../../../core/routes/app_routes.dart';
import 'custom_item.dart';
import 'custom_data_time_line.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HabitViewModel>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
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
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: cubit.habitFinalModel == null ||
                        cubit.habitFinalModel!.isEmpty
                    ? const Center(
                        child: Text(
                        "There is no Habits yet! ",
                        style: Styles.textSemiBold16,
                      ))
                    : ChangeNotifierProvider(
                      create: (BuildContext context)=> HabitViewModel(),
                      child: ListView.builder(
                          itemCount: cubit.habitFinalModel?.length ?? 0,
                          itemBuilder: (context, index) {
                            HabitFinalModel habit = cubit.habitFinalModel![index];
                            return habit.isCompleted
                                ? Opacity(
                                    opacity: .2,
                                    child: build_custom_habit(
                                        context, habit, cubit, index))
                                : GestureDetector(
                                    onLongPress: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                              padding: const EdgeInsets.all(20),
                                              decoration: const BoxDecoration(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(10))),
                                              child: Text(
                                                habit.habitName,
                                                style: Styles.textSemiBold16,
                                              ));
                                        },
                                      );
                                    },
                                    onTap: () => Navigator.pushNamed(
                                        context, AppRoutes.timer, arguments: {
                                      'index': index,
                                      'habit': habit
                                    }),
                                    child: build_custom_habit(
                                        context, habit, cubit, index),
                                  );
                          }),
                    ),
              ),
            ],
          ),
        );
      },
    );
  }

  Padding build_custom_habit(
      BuildContext context, HabitFinalModel habit, HomeCubit cubit, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: CustomItem(
          onCheck: () {
            cubit.checkHabit(index);
          },
          onEdit: () {
            print("object");
            Navigator.pushNamed(context, AppRoutes.newHabitView,
                arguments: {'index': index, 'habit': habit});

          },
          onDelete: () {
            cubit.removeHabit(index);

            setState(() {});
          },
          isHome: true,
          habit: habit),
    );
  }
}
