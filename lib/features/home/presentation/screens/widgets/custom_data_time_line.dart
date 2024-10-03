import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utlis/styles.dart';

class DataTimeLine extends StatelessWidget {
  const DataTimeLine({super.key});



  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLine(

      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {
        // print(selectedDate.day);
        //`selectedDate` the new date selected.
      },
      headerProps: const EasyHeaderProps(
        monthPickerType: MonthPickerType.dropDown,
        dateFormatter: DateFormatter.fullDateDMonthAsStrY(),
      ),
      dayProps: EasyDayProps(
        dayStructure: DayStructure.dayStrDayNum,
        activeDayStyle: DayStyle(
          dayStrStyle: Styles.textMedium14.copyWith(
            color: Colors.white,
          ),
          dayNumStyle: Styles.textMedium14.copyWith(
            color: Colors.white,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff3371FF),
                Color(0xff8426D6),
              ],
            ),
          ),
        ),
        inactiveDayStyle: DayStyle(
          dayStrStyle: Styles.textMedium14.copyWith(
            color: const Color(0xff7C84A3),
          ),
          dayNumStyle: Styles.textMedium14.copyWith(
            color: const Color(0xff7C84A3),
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffF8F8F8),
                Color(0xffF8F8F8),
              ],
            ),
          ),
        ),
        todayStyle: DayStyle(
          dayStrStyle: Styles.textMedium14.copyWith(
            color: Colors.black,
          ),
          dayNumStyle: Styles.textMedium14.copyWith(
            color: Colors.black,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff9BA3ED), width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffF8F8F8),
                Color(0xffF8F8F8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
