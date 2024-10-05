import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracking/features/home/presentation/screens/widgets/home_view_body.dart';

import '../../../../core/utlis/styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, });



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarHome(
        name: "hazem",
        onPressedAdd: () {},
      ),
      body: const HomeViewBody(),
    );
  }

  AppBar CustomAppBarHome(
      {required String name, void Function()? onPressedAdd}) {
    return AppBar(
      title: Padding(
        padding: EdgeInsets.only(top: 8.h, left: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello $name',
              style: Styles.textSemiBold24,
            ),
            Text(
              'May this day be good for you!',
              style: Styles.textMedium14.copyWith(color: Color(0xff7C84A3)),
            ),
          ],
        ),
      ),
      actions: [
        Container(
            margin: EdgeInsets.only(right: 20.w, top: 8.h),
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xff5F6CE2)),
            child: IconButton(
              onPressed: onPressedAdd,
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 24.w,
              ),
            ))
      ],
    );
  }
}
