import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracking/core/models/user_model.dart';
import 'package:habit_tracking/core/services/user_service.dart';
import 'package:habit_tracking/features/home/presentation/screens/widgets/home_view_body.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utlis/styles.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
   UserModel? user ;

  @override
  void initState() {
    getUser();
    super.initState();
  }
  Future<void> getUser() async {
    user = (await UserService.getUserData())!;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarHome(
        name: user?.username??"",
        onPressedAdd: () {
          Navigator.pushNamed(context, AppRoutes.newHabitView);
        },
      ),
      body: const HomeViewBody(),
    );
  }

  AppBar CustomAppBarHome({required String name,void Function()? onPressedAdd}) {

    return AppBar(
      automaticallyImplyLeading: false,
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
              style:
                  Styles.textMedium14.copyWith(color: const Color(0xff7C84A3)),
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

