import 'package:flutter/material.dart';
import 'package:habit_tracking/features/setting/presentation/widgets/setting_item.dart';

class SettingItemsContainer extends StatelessWidget {
  const SettingItemsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsetsDirectional.all(0),
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height *0.5,
      decoration: BoxDecoration(
        color:Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20)
      ),
      child: const Column(
        children: [
          SettingItem(listTileIcon: Icons.settings_outlined, title: "General"),
          Divider(thickness: 1,),
          SettingItem(listTileIcon: Icons.notifications_outlined, title: "Notification"),
          Divider(thickness: 1,),
          SettingItem(listTileIcon: Icons.language_outlined, title: "Language"),
          Divider(thickness: 1,),
          SettingItem(listTileIcon: Icons.share_outlined, title: "Share"),
          Divider(thickness: 1,),
          SettingItem(listTileIcon: Icons.star_border_outlined, title: "Rate us"),
          Divider(thickness: 1,),
          SettingItem(listTileIcon: Icons.headset_mic_outlined,title: "Contact Support"),

        ],
      ),
    );
  }
}