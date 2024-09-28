import 'package:flutter/material.dart';
import 'package:habit_tracking/core/utlis/styles.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsetsDirectional.all(20),
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height * 0.12,
      child: Stack(
        children: [
          const Positioned(
            left: 20,
            top: 0,
            bottom: 0,
            child: CircleAvatar(
              maxRadius:35 ,
              minRadius: 35,

            ),
          ),
          const Positioned(
            left: 120,
            top: 0,
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Zahir Mirzamammadili",
                  style: Styles.textMedium14,
                ),
                Text(
                  "Zahirmirz@gmail.com",
                  style: Styles.textRegular10,
                )
              ],
            ),
          ),
          Positioned(
            right: 10,
            top: 0,
            bottom: 0,
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.edit)))
        ],
      ),
    );
  }
}
