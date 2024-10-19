import 'package:flutter/material.dart';
import 'package:habit_tracking/core/utlis/styles.dart';

import '../../../../core/models/user_model.dart';
import '../../../../core/services/user_service.dart';

class UserInfoCard extends StatefulWidget {
  const UserInfoCard({super.key});

  @override
  State<UserInfoCard> createState() => _UserInfoCardState();
}



class _UserInfoCardState extends State<UserInfoCard> {
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
           Positioned(
            left: 24,
            top: 0,
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  user?.username ?? "Nada",
                  style: Styles.textMedium16,
                ),
                Text(
                  user?.email ?? "Nada@11",
                  style: Styles.textRegular14,
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
