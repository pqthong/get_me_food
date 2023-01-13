import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:give_me_food/controller/cart_controller.dart';
import 'package:give_me_food/controller/popular_product_controller.dart';
import 'package:give_me_food/pages/home/main_food_page.dart';
import 'package:give_me_food/utils/app_constants.dart';
import 'package:give_me_food/utils/dimensions.dart';
import 'package:give_me_food/widgets/app_column.dart';
import 'package:give_me_food/widgets/app_icon.dart';
import 'package:give_me_food/widgets/expandable_text_widget.dart';

import '../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  int pageId;

  PopularFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(Get.find<CartController>(), product);
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
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(AppConstants.BASE_URL +
                            AppConstants.UPLOAD_URL +
                            product.img!))),
              )),
          // icon image
          Positioned(
              top: Dimension.height10 * 4.5,
              left: Dimension.width20,
              right: Dimension.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: AppIcon(icon: Icons.arrow_back_ios),
                    onTap: () {
                      Get.to(() => MainFoodPage());
                    },
                  ),
                  GetBuilder<PopularProductController>(
                      builder: (popularProductController) {
                    return Stack(
                      children: [
                        AppIcon(icon: Icons.shopping_cart_checkout_outlined),
                        popularProductController.totalItems >= 1
                            ? Positioned(
                                child: AppIcon(
                                  icon: Icons.circle,
                                  size: 20,
                                  iconColor: Colors.transparent,
                                  backgroundColor: AppColors.mainColor,
                                ),
                                right: 0,
                                top: 0,
                              )
                            : Container(),
                        popularProductController.totalItems >= 1
                            ? Positioned(
                                child: BigText(
                                  text: popularProductController.totalItems
                                      .toString(),
                                  size: 12,
                                  color: Colors.white,
                                ),
                                right: 4,
                                top: 3,
                              )
                            : Container(),
                      ],
                    );
                  })
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
                        text: product.name!,
                      ),
                      SizedBox(
                        height: Dimension.height20,
                      ),
                      BigText(text: "Introduce"),
                      Flexible(
                        flex: 0,
                        child: SingleChildScrollView(
                            child: ExpandableTextWidget(
                                text: product.description!)),
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (popularProductController) {
          return Container(
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
                      GestureDetector(
                        child: const Icon(
                          Icons.remove,
                          color: AppColors.signColor,
                        ),
                        onTap: () {
                          popularProductController.setQuantity(false);
                        },
                      ),
                      SizedBox(
                        width: Dimension.width10 / 2,
                      ),
                      BigText(
                          text: popularProductController.inCartItem.toString()),
                      SizedBox(
                        width: Dimension.width10 / 2,
                      ),
                      GestureDetector(
                        onTap: () {
                          popularProductController.setQuantity(true);
                        },
                        child: const Icon(
                          Icons.add,
                          color: AppColors.signColor,
                        ),
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
                  child: GestureDetector(
                    onTap: () {
                      popularProductController.addItem(product);
                    },
                    child: BigText(
                      text: "\$${product.price}" + " | Add to cart",
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
