

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HabitsBarChart extends StatelessWidget {
  final List<int> habitsPerDay; // Number of habits done each day (Sunday to Saturday)

  const HabitsBarChart({super.key, required this.habitsPerDay});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child:
      BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: (habitsPerDay.reduce((a, b) => a > b ? a : b) + 2.0), // Adjust maxY based on the highest value
          barTouchData: BarTouchData(enabled: true),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (double value, TitleMeta meta) {
                  const style = TextStyle(color: Colors.black, fontSize: 14);
                  Widget text;
                  switch (value.toInt()) {
                    case 0:
                      text = const Text('Sun', style: style);
                      break;
                    case 1:
                      text = const Text('Mon', style: style);
                      break;
                    case 2:
                      text = const Text('Tue', style: style);
                      break;
                    case 3:
                      text = const Text('Wed', style: style);
                      break;
                    case 4:
                      text = const Text('Thu', style: style);
                      break;
                    case 5:
                      text = const Text('Fri', style: style);
                      break;
                    case 6:
                      text = const Text('Sat', style: style);
                      break;
                    default:
                      text = const Text('', style: style);
                      break;
                  }
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    space: 8, // Space between the title and the axis line
                    child: text,
                  );
                },
                reservedSize: 40,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (double value, TitleMeta meta) {
                  return Text(
                    value.toInt().toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.left,
                  );
                },
                interval: 1, // Space between the values on the y-axis
                reservedSize: 40,
              ),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          gridData: const FlGridData(show: true),
          borderData: FlBorderData(
            show: false,
          ),
          barGroups: _buildBarGroups(),
        ),
      ),
    );
  }

  List<BarChartGroupData> _buildBarGroups() {
    return List.generate(habitsPerDay.length, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: habitsPerDay[index].toDouble(),
            color: Colors.lightBlueAccent,
            width: 20,
            borderRadius: BorderRadius.circular(5),
          ),
        ],
      );
    });
  }
}


