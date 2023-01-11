import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:give_me_food/utils/colors.dart';
import 'package:give_me_food/utils/dimensions.dart';
import 'package:give_me_food/widgets/app_icon.dart';
import 'package:give_me_food/widgets/big_text.dart';
import 'package:give_me_food/widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                child: Center(
                    child: BigText(
                  text: 'Chinese Side',
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
              background: Image.asset(
                "assets/image/food0.png",
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
                    child: ExpandableTextWidget(
                        text:
                            ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer metus velit, vehicula et felis eu, hendrerit consequat nibh. Integer tristique odio blandit aliquam tincidunt. Phasellus eleifend, sapien et vulputate luctus, massa velit vulputate turpis, id accumsan ipsum diam et velit. Ut pharetra ante quis dui placerat ornare. Nam eros lectus, iaculis a velit sit amet, luctus sodales nisi. Praesent id ullamcorper mauris, a feugiat felis. Nullam non lacinia mauris. Proin a neque non orci ultricies posuere. Mauris sit amet semper enim. Vivamus non bibendum leo. Vestibulum maximus erat eget metus tristique, et imperdiet dolor laoreet. Fusce luctus mauris lacus, pellentesque mattis justo euismod euAliquam erat volutpat. Proin ultricies semper magna, at faucibus ex viverra vitae. Proin laoreet elementum finibus. Morbi porttitor magna sit amet laoreet condimentum. Duis id est feugiat, egestas justo eu, pulvinar ex. Duis aliquet turpis eget metus gravida ultricies. In quis interdum semNam tristique et est at ultricies. Cras eleifend consequat nisl molestie condimentum. Nullam nibh tellus, pulvinar in fermentum eget, tincidunt nec arcu. Aenean dignissim, elit et varius aliquam, magna ligula lobortis velit, ut maximus diam magna eget diam. Vivamus elementum sem at ante aliquam laoreet. Donec eleifend velit felis, sollicitudin tincidunt est blandit ut. Duis sodales vehicula orci, ut vestibulum nisi sollicitudin vitae.Cras ut commodo est, at euismod enim. Aliquam condimentum pretium mi, non semper ante lobortis eget. Integer venenatis neque quis viverra convallis. Curabitur diam felis, dignissim nec tellus et, scelerisque laoreet odio. Nullam facilisis enim vitae purus dictum efficitur. Proin ac nisi congue mauris iaculis venenatis. Etiam vulputate augue sed dapibus tristique. Integer vel urna rhoncus, aliquet ligula vel, rutrum justo.Nunc luctus, lacus vel ornare dapibus, quam nulla placerat enim, dictum cursus lacus mauris at leo. Morbi feugiat diam ac quam rutrum mattis. In id leo in enim varius venenatis. Ut lacus justo, ullamcorper at erat ut, cursus mollis diam. Vestibulum posuere nunc eu felis convallis hendrerit. Mauris semper egestas nisi quis cursus. Phasellus maximus ex ac quam ornare, ac auctor nisi fermentum. Mauris quis rutrum dui. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla a lobortis justo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nam nisi felis, suscipit sed pretium sed, imperdiet at orci. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed tristique gravida turpis maximus tempor.Donec tempor sagittis diam vitae cursus. Sed mattis odio a lacus tincidunt pellentesque. Fusce pulvinar consectetur imperdiet. Aliquam porta ligula velit, eu consequat libero fringilla nec. Quisque dapibus mauris felis, eu fermentum nunc finibus pellentesque. Phasellus nulla lacus, sollicitudin non consectetur vel, auctor vel metus. Donec sagittis semper augue. Etiam mattis ultrices lacus, et convallis nisl egestas ut. In congue eros hendrerit, imperdiet leo non, finibus nisi. Cras aliquam ullamcorper blandit. Mauris aliquam posuere hendrerit. Ut quis placerat mi.Praesent aliquam tellus dui, sed pharetra ante auctor at. Praesent at arcu et justo congue rhoncus. Sed a nisi aliquam, efficitur ex et, pharetra.,')),
              ],
            )),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: Dimension.width20 * 2.5,
                vertical: Dimension.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  iconSize: Dimension.iconSize24,
                  icon: Icons.remove,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                ),
                BigText(
                  text: "\$12.88" " X " "0",
                  color: AppColors.mainBlackColor,
                  size: Dimension.font26,
                ),
                AppIcon(
                  iconSize: Dimension.iconSize24,
                  icon: Icons.add,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
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
                        borderRadius: BorderRadius.circular(Dimension.radius20),
                        color: Colors.white),
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                      size: 24,
                    )),
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
        ],
      ),
    );
  }
}
