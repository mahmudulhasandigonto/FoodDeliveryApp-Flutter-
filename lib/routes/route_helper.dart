import 'package:get/get.dart';
import 'package:practice_all/pages/cart/cart_page.dart';
import 'package:practice_all/pages/food/popular_food_details.dart';
import 'package:practice_all/pages/food/recommended_food_details.dart';
import 'package:practice_all/pages/home/home_page.dart';
import 'package:practice_all/pages/splash/splash_page.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";

  static String getSplashPge() => "$splashPage";
  static String getInitial() => '$initial';

  static String getPopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(name: initial, page: () => HomePage()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return PopularFoodDetails(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return RecommendedFoodDetails(
              pageId: int.parse(pageId!), page: page!);
        }),
    GetPage(
        name: cartPage,
        page: () {
          return CartPage();
        },

        transition: Transition.fadeIn)
  ];
}
