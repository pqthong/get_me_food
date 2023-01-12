import 'package:get/get.dart';
import 'package:give_me_food/pages/food/popular_food_detail.dart';
import 'package:give_me_food/pages/food/recommended_food_detail.dart';
import 'package:give_me_food/pages/home/main_food_page.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";

  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';

  static String getRecommendedFood() => '$recommendedFood';

  static String getInitial() => '$initial';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainFoodPage()),
    GetPage(
        name: popularFood,
        transition: Transition.fadeIn,
        page: () {
          int pageId = int.parse(Get.parameters['pageId']!) ;
          return PopularFoodDetail(pageId: pageId);
        }),
    GetPage(
        name: recommendedFood,
        transition: Transition.fadeIn,
        page: () {
          return RecommendedFoodDetail();
        })
  ];
}
