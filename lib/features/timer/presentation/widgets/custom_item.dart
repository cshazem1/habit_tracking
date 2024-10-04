import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracking/features/timer/data/models/item_model.dart';
import 'package:habit_tracking/features/timer/presentation/widgets/text_and_title_item.dart';
import 'custom_icon_item.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({
    required this.itemModel,
    this.isHome = false,
    super.key,
  });
  final ItemModel itemModel;
  final bool isHome;
  @override
  Widget build(BuildContext context) {
    return Container(
    margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color:  const Color(0xffF8F8F8)
      ),
      child: SizedBox(
        height: 64.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 48.h,
                  width: 48.w,
                  child: CustomIconItem(
                    color: itemModel.color,
                    image: itemModel.image,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                TextAndTitleItem(
                  isHome: isHome,
                  title: itemModel.title,
                  subTitle: itemModel.subTitle,
                  totalTime: itemModel.totalTime,
                )
              ],
            ),
            isHome
                ? GestureDetector(
                  onTap: () {
                  },
                  child: Container(
                      width: 24.w,
                      height: 24.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          color: const Color(0xff5F6CE2)),
                      child: Icon(
                        Icons.check,
                        size: 16.w,
                        color: Colors.white,
                        weight: 50,
                      )),
                )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
