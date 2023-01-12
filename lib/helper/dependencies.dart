import 'package:get/get.dart';
import 'package:give_me_food/controller/popular_product_controller.dart';
import 'package:give_me_food/controller/recommeded_product_controller.dart';
import 'package:give_me_food/data/api/api_client.dart';
import 'package:give_me_food/data/repository/popular_product_repo.dart';
import 'package:give_me_food/data/repository/recommended_product_repo.dart';
import 'package:give_me_food/utils/app_constants.dart';

Future<void> init() async {
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));

  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));

}
