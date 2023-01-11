import 'package:get/get.dart';
import 'package:give_me_food/controller/popular_product_controller.dart';
import 'package:give_me_food/data/api/api_client.dart';
import 'package:give_me_food/data/repository/popular_product_repo.dart';

Future<void> init() async {
  Get.lazyPut(() => ApiClient(appBaseUrl: "https://www.mvs.bslmeiyu.com")
  );
  // api client
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find())
  );
  // api client
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
