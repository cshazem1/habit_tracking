

import 'package:flutter/material.dart';
import 'package:habit_tracking/core/utlis/styles.dart';

import 'bar_chart_widget.dart';

class ProgressChartContainer extends StatelessWidget {

  final String percentage;
  final  List<int> habitsPerDayList;

  const ProgressChartContainer({super.key, required this.percentage, required this.habitsPerDayList});

  @override
  Widget build(BuildContext context) {
    List<int> habitsPerDay = [3, 5, 2, 4, 6, 3, 1];
    return Container(
      padding: const EdgeInsetsDirectional.all(10),
      margin: const EdgeInsets.all(20),
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          const Text("Total Activities", style: Styles.textMedium16),
          const SizedBox(height: 5),
           Text("$percentage %", style: Styles.textSemiBold32),
          const SizedBox(height: 10),
          Expanded(
            child: BarChartWidget(habitsPerDay: habitsPerDayList),
          ),
        ],
      ),
    );
  }
}
// class ProgressChartContainer extends StatelessWidget {
//    const ProgressChartContainer({super.key});
//
//
//   @override
//   Widget build(BuildContext context) {
//     List<int> habitsPerDay = [3, 5, 2, 4, 6, 3, 1];
//     return Container(
//       padding: const EdgeInsetsDirectional.all(10),
//       margin: const EdgeInsets.all(20),
//       width: double.maxFinite,
//       height: MediaQuery.of(context).size.height *0.4,
//       decoration: BoxDecoration(
//         color: Colors.grey.shade200,
//         borderRadius: BorderRadius.circular(10)
//       ),
//       child:   Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 5,),
//           const Text("Total Activities",style: Styles.textMedium16,),
//           const SizedBox(height: 5,),
//           const Text("78%" , style: Styles.textSemiBold32,),
//           const SizedBox(height: 5,),
//           SizedBox(
//               height: double.maxFinite,
//               width: double.maxFinite,
//               child: HabitsBarChart(habitsPerDay: habitsPerDay,))
//
//
//         ],
//       ),
//
//     );
//   }
// }
