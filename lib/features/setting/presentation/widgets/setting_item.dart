
import 'package:flutter/material.dart';
import 'package:habit_tracking/core/utlis/styles.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({super.key, required this.listTileIcon, required this.title});
  final IconData listTileIcon ;
  final String title ;

  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:Icon(listTileIcon, size: 20) ,
      title: Text(title,style: Styles.textMedium12, ) ,
      trailing: IconButton(onPressed: (){} ,icon: const Icon(Icons.navigate_next)),
    );
  }


}
