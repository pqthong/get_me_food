
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:give_me_food/utils/dimensions.dart';
import 'package:give_me_food/widgets/small_text.dart';

import '../utils/colors.dart';
import 'big_text.dart';
import 'icon_and_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text, size: Dimension.font26,),
        SizedBox(
          height: Dimension.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                      (index) => const Icon(
                    Icons.star,
                    color: AppColors.mainColor,
                    size: 15,
                  )),
            ),
            SizedBox(
              width: 10,
            ),
            SmallText(text: "4.5"),
            SizedBox(
              width: 10,
            ),
            SmallText(text: "1287"),
            SizedBox(
              width: 5,
            ),
            SmallText(text: "comments")
          ],
        ),
        SizedBox(
          height: Dimension.height20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            IconAndTextWidget(
                icon: Icons.circle_sharp,
                text: "Normal",
                iconColor: AppColors.iconColor1),
            IconAndTextWidget(
                icon: Icons.location_on,
                text: "1.7km",
                iconColor: AppColors.mainColor),
            IconAndTextWidget(
                icon: Icons.access_time_rounded,
                text: "Normal",
                iconColor: AppColors.iconColor2),
          ],
        ),
      ],
    );
  }
}
