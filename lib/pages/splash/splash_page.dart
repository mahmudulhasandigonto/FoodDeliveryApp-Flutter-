import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_all/controllers/cart_controller.dart';
import 'package:practice_all/controllers/popular_product_controller.dart';
import 'package:practice_all/controllers/recommended_product_controller.dart';
import 'package:practice_all/routes/route_helper.dart';
import 'package:practice_all/utils/dimensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  _loadResource() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
    await Get.find<CartController>().getCartData();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadResource();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    Timer(const Duration(seconds: 3),
        () => Get.offNamed(RouteHelper.getInitial()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ScaleTransition(
            scale: animation,
            child: Center(
                child: Image.asset("assets/image/logo.png",
                    width: Dimensions.splashImg))),
        Center(child: Text("Arganic Food")),
      ],
    ));
  }
}
