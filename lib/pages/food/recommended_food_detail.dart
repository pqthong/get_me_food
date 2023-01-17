import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:give_me_food/controller/recommeded_product_controller.dart';
import 'package:give_me_food/routes/route_helper.dart';
import 'package:give_me_food/utils/app_constants.dart';
import 'package:give_me_food/utils/colors.dart';
import 'package:give_me_food/utils/dimensions.dart';
import 'package:give_me_food/widgets/app_icon.dart';
import 'package:give_me_food/widgets/big_text.dart';
import 'package:give_me_food/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';
import '../../controller/cart_controller.dart';
import '../../controller/popular_product_controller.dart';
import '../cart/cart_page.dart';

class RecommendedFoodDetail extends StatelessWidget {
  int pageId;
  String page;

  RecommendedFoodDetail({Key? key, required this.pageId, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(Get.find<CartController>(), product);
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 80,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: AppIcon(icon: Icons.clear),
                    onTap: () {
                      if (page == 'cartpage') {
                        Get.toNamed(RouteHelper.getCartPage());
                      } else {
                        Get.toNamed(RouteHelper.getInitial());
                      }
                    },
                  ),
                  GetBuilder<PopularProductController>(
                      builder: (popularProductController) {
                    return GestureDetector(
                      onTap: () {
                        if (popularProductController.totalItems >= 1) {
                          Get.toNamed(RouteHelper.getCartPage());
                        }
                      },
                      child: Stack(
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
                      ),
                    );
                  })
                ],
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(20),
                child: Container(
                  width: double.maxFinite,
                  child: Center(
                      child: BigText(
                    text: product.name!,
                    size: Dimension.font26,
                  )),
                  padding: EdgeInsets.only(top: 5, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimension.radius20),
                          topRight: Radius.circular(Dimension.radius20))),
                ),
              ),
              pinned: true,
              backgroundColor: AppColors.yellowColor,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  AppConstants.BASE_URL +
                      AppConstants.UPLOAD_URL +
                      product.img!,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                  child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(
                          left: Dimension.width20, right: Dimension.width20),
                      child: ExpandableTextWidget(text: product.description!))
                ],
              )),
            )
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (controller) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimension.width20 * 2.5,
                      vertical: Dimension.height10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.setQuantity(false);
                        },
                        child: AppIcon(
                          iconSize: Dimension.iconSize24,
                          icon: Icons.remove,
                          iconColor: Colors.white,
                          backgroundColor: AppColors.mainColor,
                        ),
                      ),
                      BigText(
                        text: "\$${product.price}"
                            " X "
                            "${controller.inCartItem}",
                        color: AppColors.mainBlackColor,
                        size: Dimension.font26,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.setQuantity(true);
                        },
                        child: AppIcon(
                          iconSize: Dimension.iconSize24,
                          icon: Icons.add,
                          iconColor: Colors.white,
                          backgroundColor: AppColors.mainColor,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
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
                              borderRadius:
                                  BorderRadius.circular(Dimension.radius20),
                              color: Colors.white),
                          child: Icon(
                            Icons.favorite,
                            color: AppColors.mainColor,
                            size: 24,
                          )),
                      GestureDetector(
                        onTap: () {
                          controller.addItem(product);
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              top: Dimension.height20,
                              bottom: Dimension.height20,
                              left: Dimension.width20,
                              right: Dimension.width20),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimension.radius20),
                              color: AppColors.mainColor),
                          child: BigText(
                            text: "\$${product.price} | Add to cart",
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ));
  }
}
