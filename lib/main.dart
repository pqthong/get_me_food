import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:give_me_food/controller/popular_product_controller.dart';
import 'package:give_me_food/controller/recommeded_product_controller.dart';
import 'package:give_me_food/pages/food/popular_food_detail.dart';
import 'package:give_me_food/pages/food/recommended_food_detail.dart';
import 'package:give_me_food/pages/home/food_page_body.dart';
import 'package:give_me_food/pages/home/main_food_page.dart';
import 'package:give_me_food/routes/route_helper.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const MainFoodPage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}
