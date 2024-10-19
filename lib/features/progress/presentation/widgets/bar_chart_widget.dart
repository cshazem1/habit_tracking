import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartWidget extends StatelessWidget {
  final List<int> habitsPerDay;

  BarChartWidget({required this.habitsPerDay});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceEvenly,
        barGroups: [
          for (int i = 0; i < habitsPerDay.length; i++)
            BarChartGroupData(
              x: i,
              barRods: [
                BarChartRodData(
                  toY: habitsPerDay[i].toDouble(),  // Updated y -> toY
                  color: Colors.blue,
                ),
              ],
            ),
        ],
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (double value, TitleMeta meta) {  // Updated getTitles -> getTitlesWidget
                switch (value.toInt()) {
                  case 0:
                    return Text('S');
                  case 1:
                    return Text('M');
                  case 2:
                    return Text('T');
                  case 3:
                    return Text('W');
                  case 4:
                    return Text('T');
                  case 5:
                    return Text('Fr');
                  case 6:
                    return Text('S');
                  default:
                    return Text('');
                }
              },
            ),
          ),
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: true),
          ),
        ),
      ),
    );
  }
}
