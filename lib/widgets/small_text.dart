import 'package:flutter/cupertino.dart';
import 'package:give_me_food/utils/colors.dart';

class SmallText extends StatelessWidget {
  Color color;
  final String text;
  double size;
  double height;

  SmallText(
      {Key? key,
      required this.text,
      this.color = AppColors.textColor,
      this.height = 1.2,
      this.size = 12})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: size,
        color: color,
      ),
    );
  }
}
