import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:give_me_food/utils/dimensions.dart';
import 'package:give_me_food/widgets/app_column.dart';
import 'package:give_me_food/widgets/app_icon.dart';
import 'package:give_me_food/widgets/expandable_text_widget.dart';

import '../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //background image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimension.popularFoodImageSize,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/image/food0.png"))),
              )),
          // icon image
          Positioned(
              top: Dimension.height10 * 4.5,
              left: Dimension.width20,
              right: Dimension.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios),
                  AppIcon(icon: Icons.shopping_cart_checkout_outlined)
                ],
              )),
          // introduction of food
          Positioned(
              left: 0,
              right: 0,
              top: Dimension.popularFoodImageSize - Dimension.height20,
              child: Container(
                padding: EdgeInsets.all(Dimension.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimension.radius20),
                      topLeft: Radius.circular(Dimension.radius20)),
                ),
                child: Container(
                  padding: EdgeInsets.only(
                      top: Dimension.height20, left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(
                        text: "Chinese Side",
                      ),
                      SizedBox(
                        height: Dimension.height20,
                      ),
                      BigText(text: "Introduce"),
                      SingleChildScrollView(
                          child: SizedBox(
                            height: 1000,
                            child: ExpandableTextWidget(
                                text:
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                          )),
                    ],
                  ),
                ),
              ))
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimension.bottomHeightBar,
        padding: EdgeInsets.only(
            top: Dimension.height30,
            bottom: Dimension.height30,
            left: Dimension.width20,
            right: Dimension.width20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimension.radius20 * 2),
                topRight: Radius.circular(Dimension.radius20 * 2)),
            color: AppColors.buttonBackgroundColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: Dimension.height20,
                  bottom: Dimension.height20,
                  left: Dimension.width20,
                  right: Dimension.width20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.radius20),
                  color: Colors.white),
              child: Row(
                children: [
                  Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(
                    width: Dimension.width10 / 2,
                  ),
                  BigText(text: "0"),
                  SizedBox(
                    width: Dimension.width10 / 2,
                  ),
                  Icon(
                    Icons.add,
                    color: AppColors.signColor,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: Dimension.height20,
                  bottom: Dimension.height20,
                  left: Dimension.width20,
                  right: Dimension.width20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.radius20),
                  color: AppColors.mainColor),
              child: BigText(
                text: "\$10 | Add to cart",
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
