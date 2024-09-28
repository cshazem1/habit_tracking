

import 'package:flutter/material.dart';
import 'package:habit_tracking/core/utlis/styles.dart';
import 'package:habit_tracking/features/setting/presentation/widgets/log_out_btton.dart';
import 'package:habit_tracking/features/setting/presentation/widgets/setting_items_container.dart';
import 'package:habit_tracking/features/setting/presentation/widgets/user_info_card.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Setting",style: Styles.textSemiBold16,),
        centerTitle: true,
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back))),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          UserInfoCard(),
          SettingItemsContainer(),
          LogOutBtton()
        ],
      ),
    );
  }
}
