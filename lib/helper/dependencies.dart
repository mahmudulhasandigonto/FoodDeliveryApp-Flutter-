import 'package:get/get.dart';
import 'package:practice_all/controllers/cart_controller.dart';
import 'package:practice_all/controllers/popular_product_controller.dart';
import 'package:practice_all/controllers/recommended_product_controller.dart';
import 'package:practice_all/data/api/api_client.dart';
import 'package:practice_all/data/repository/cart_repo.dart';
import 'package:practice_all/data/repository/popular_product_repo.dart';
import 'package:practice_all/data/repository/recommended_product_repo.dart';
import 'package:practice_all/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  //Api Client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //Repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));

  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
