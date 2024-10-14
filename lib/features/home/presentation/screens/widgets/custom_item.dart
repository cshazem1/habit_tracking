import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracking/features/timer/presentation/manager/timer_cubit/timer_cubit.dart';
import 'package:habit_tracking/features/timer/presentation/widgets/text_and_title_item.dart';
import '../../../../new habit/Data/model/habits_final_model.dart';
import '../../../../timer/presentation/widgets/custom_icon_item.dart';

class CustomItem extends StatefulWidget {
  const CustomItem({
    required this.onDelete,
    this.habit,
    this.isHome = false,
    this.onEdit,
    this.onCheck,
    super.key,
  });

  final HabitFinalModel? habit;
  final bool isHome;
  final Function()? onDelete;
  final Function()? onEdit;
  final Function()? onCheck;

  @override
  State<CustomItem> createState() => _CustomItemState();
}

class _CustomItemState extends State<CustomItem>
    with SingleTickerProviderStateMixin {
  bool isMore = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TimerCubit cubit = TimerCubit.get(context);

    return widget.isHome ? Dismissible(

      confirmDismiss: (direction) async {
        return direction == DismissDirection.endToStart;
      },
      secondaryBackground: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      background: Container(
        color: Colors.blue,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.edit, color: Colors.white),
      ),
      key: UniqueKey(),


      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          widget.onDelete!();
        }

        if (direction == DismissDirection.startToEnd) {
          widget.onEdit!();
        }
      },
      child: buildContainer(cubit),
    ): buildContainer(cubit);
  }

  Container buildContainer(TimerCubit cubit) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xffF8F8F8),
      ),
      child: SizedBox(
        height: 80.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 64.h,
                  width: 64.w,
                  child: CustomIconItem(
                    color: widget.habit?.habitColor ?? 0,
                    image: widget.habit?.habitIcon ?? '',
                  ),
                ),
                SizedBox(width: 10.w),
                TextAndTitleItem(

                  isHome: widget.isHome,
                  title: widget.habit?.habitName ?? '',
                  subTitle:widget.isHome? DateTime(
                              DateTime.parse(widget.habit!.reminder).year,
                              DateTime.parse(widget.habit!.reminder).month,
                              DateTime.parse(widget.habit!.reminder).day)
                          .toIso8601String()
                          .split('T')
                          .first ??
                      '':(cubit.maxTime!~/60).toString(),
                  totalTime: !widget.isHome
                      ? (cubit.maxTime! - cubit.remainingTime!).toString()
                      : widget.habit!.timer.toString(),
                )
              ],
            ),
            widget.isHome
                ? Row(
                    children: [
                      GestureDetector(
                        onTap: widget.onCheck,
                        child: Container(
                          width: 30.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200),
                            color: const Color(0xff5F6CE2),
                          ),
                          child: widget.habit?.isCompleted == true
                              ? Icon(
                                  Icons.check,
                                  size: 25.w,
                                  color: Colors.white,
                                )
                              : Icon(
                                  Icons.cancel_outlined,
                                  size: 25.w,
                                  color: Colors.white,
                                ),
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
