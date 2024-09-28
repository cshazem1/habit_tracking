import 'package:flutter/material.dart';

class ProgressTabBar extends StatelessWidget {
  const ProgressTabBar({super.key});
  

  @override
  Widget build(BuildContext context) {
    return  const DefaultTabController(
      length: 3,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: TabBar(
          dividerHeight: 0,
          unselectedLabelColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.tab ,
          labelColor: Colors.white,
          indicator: BoxDecoration(
            color: Color(0xba5F6CE2),
            borderRadius: BorderRadius.all(Radius.circular(8))
          ),
          tabs: [
            Tab(text: "Weekly",),
            Tab(text: "Monthly",),
            Tab(text: "Yearly",),
          ],
        ),
      ),
    );
  }
}