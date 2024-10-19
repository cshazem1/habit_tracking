import 'package:flutter/material.dart';

class ProgressTabBar extends StatelessWidget {
  const ProgressTabBar({super.key, required this.tabController});
  final TabController tabController;


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(20.0),
      child: TabBar(
        controller: tabController ,
        dividerHeight: 0,
        unselectedLabelColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.tab ,
        labelColor: Colors.white,
        indicator: const BoxDecoration(
            color: Color(0xba5F6CE2),
            borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        tabs: [
          Tab(text: "Weekly",),
          Tab(text: "Monthly",),
          Tab(text: "Yearly",),
        ],
      ),
    );
  }
}