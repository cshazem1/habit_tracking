import 'package:flutter/cupertino.dart';
import '../../../../core/utlis/styles.dart';

class StartingImageAndText extends StatelessWidget {
   const StartingImageAndText({super.key, required this.image, required this.title, required this.title2, required this.subTitle});
  final String image, title, subTitle;
  final String title2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16,60,16,60),
      child: Column(
        children: [
          Image(width:336 ,
            height:317,
            image: AssetImage(image),
          ),
          const SizedBox(height: 64,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                style: Styles.textSemiBold32.copyWith(color: const Color(0xff2F3138)),
                textAlign: TextAlign.start,


              ),
              Text(title2,
                style: Styles.textSemiBold32.copyWith(color: const Color(0xff5F6CE2)),
                textAlign: TextAlign.start,

              ),
              const SizedBox(height: 32,),
              Text(subTitle,
                style: Styles.textMedium14.copyWith(color: const Color(0xff7C84A3)),
                textAlign: TextAlign.left,
              ),
            ],
          )
        ],
      ),
    );
  }
}
