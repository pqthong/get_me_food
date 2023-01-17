import 'package:flutter/cupertino.dart';
import 'package:give_me_food/utils/colors.dart';
import 'package:give_me_food/utils/dimensions.dart';

class BigText extends StatelessWidget {
  Color color;
  final String text;
  double size;
  TextOverflow overFlow;

  BigText(
      {Key? key,
      required this.text,
      this.color = AppColors.mainBlackColor,
      this.overFlow = TextOverflow.ellipsis,
      this.size = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: size == 0 ? Dimension.font16 : size,
          color: color,
          fontWeight: FontWeight.w400),
    );
  }
}
