import 'package:flutter/material.dart';
import 'package:habit_tracking/features/progress/presentation/widgets/monthly_progress_view.dart';
import 'package:habit_tracking/features/progress/presentation/widgets/progress_tab_bar.dart';
import 'package:habit_tracking/features/progress/presentation/widgets/weekly_progress_view.dart';
import 'package:habit_tracking/features/progress/presentation/widgets/yearly_progress_view.dart';

import '../../../core/utlis/styles.dart';



class ProgressView extends StatefulWidget {
  const ProgressView({super.key});

  @override
  _ProgressViewState createState() => _ProgressViewState();
}

class _ProgressViewState extends State<ProgressView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  const Text('Progress',style: Styles.textSemiBold24,),
      ),
      body: Column(
        children: [
          ProgressTabBar(tabController: _tabController),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                WeeklyProgressView(),
                MonthlyProgressView(),
                YearlyProgressView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
