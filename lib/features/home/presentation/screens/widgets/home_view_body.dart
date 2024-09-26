import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracking/core/utlis/styles.dart';
import 'package:habit_tracking/features/home/presentation/screens/home_view.dart';
import 'package:habit_tracking/features/timer/presentation/widgets/custom_item.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../generated/assets.dart';
import '../../../../timer/data/models/item_model.dart';
import 'custom_data_time_line.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          const DataTimeLine(),
          SizedBox(
            height: 40.h,
          ),
          const Text(
            "Today",
            style: Styles.textSemiBold20,
          ),
          SizedBox(height: 20,),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.timer);

                        print("object");
                      },
                      child: CustomItem(
                        isHome: true,
                        itemModel: ItemModel(
                            title: "Read a book ",
                            subTitle: " 9:30 am",
                            image: Assets.imagesBagDynamicColor,
                            totalTime: "10"), ),
                    ),
                  );
                }),
          ),


        ],
      ),
    );
  }
}
