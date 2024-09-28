import 'package:flutter/material.dart';

class LogOutBtton extends StatelessWidget {
  const LogOutBtton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height * 0.07,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.grey.shade200),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout_outlined,color: Colors.red,),
            Text("Log Out",style: TextStyle(color: Colors.red, fontSize: 16),)
          ],
        ),
      ),
    );
  }
}
