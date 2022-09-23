import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_all/controllers/cart_controller.dart';
import 'package:practice_all/controllers/popular_product_controller.dart';
import 'package:practice_all/controllers/recommended_product_controller.dart';
import 'package:practice_all/routes/route_helper.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    // Get.find<CartController>().getCartData();
    return GetBuilder<CartController>(builder: (_) {
      return GetBuilder<PopularProductController>(builder: (_) {
        return GetBuilder<RecommendedProductController>(builder: (_) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            initialRoute: RouteHelper.getSplashPge(),
            getPages: RouteHelper.routes,
            // home: SplashScreen(),
            // home: RecommendedFoodDetails(),
            // home: Practice(),
            // home: MainFoodPage(),
            // home: PopularFoodDetails(),
            // home: CartPage(),
          );
        });
      });
    });
  }
}

class SnakeBarPage extends StatelessWidget {
  const SnakeBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center();
  }
}
