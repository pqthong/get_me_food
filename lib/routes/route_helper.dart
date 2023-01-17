import 'package:get/get.dart';
import 'package:give_me_food/pages/cart/cart_page.dart';
import 'package:give_me_food/pages/food/popular_food_detail.dart';
import 'package:give_me_food/pages/food/recommended_food_detail.dart';
import 'package:give_me_food/pages/home/home_page.dart';
import 'package:give_me_food/pages/home/main_food_page.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";

  static String getPopularFood(int pageId, String page) => '$popularFood?pageId=$pageId&page=$page';

  static String getRecommendedFood(int pageId, String page) => '$recommendedFood?pageId=$pageId&page=$page';

  static String getInitial() => '$initial';

  static String getCartPage() => '$cartPage';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => HomePage()),
    GetPage(
        name: popularFood,
        transition: Transition.fadeIn,
        page: () {
          int pageId = int.parse(Get.parameters['pageId']!) ;
          var page = Get.parameters['page'];
          return PopularFoodDetail(pageId: pageId, page: page!);
        }),
    GetPage(
        name: recommendedFood,
        transition: Transition.fadeIn,
        page: () {
          int pageId = int.parse(Get.parameters['pageId']!) ;
          var page = Get.parameters['page'];
          return RecommendedFoodDetail(pageId: pageId, page: page!);
        }),
    GetPage(
        name: cartPage,
        transition: Transition.fadeIn,
        page: () {
         // int pageId = int.parse(Get.parameters['pageId']!) ;
          return CartPage();
        })
  ];
}
