import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_all/controllers/cart_controller.dart';
import 'package:practice_all/utils/colors.dart';
import 'package:practice_all/utils/dimensions.dart';
import 'package:practice_all/widgets/app_icon.dart';
import 'package:practice_all/widgets/big_text.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var getCartHistoryList = Get.find<CartController>().getCartHistoryList();
    var getCartHistoryList = [];

    Map<String, int> cartItemsPerOrder = Map();

    for (var i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time!)) {
        cartItemsPerOrder.update(getCartHistoryList[i].time!, (value) => 1);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    List<int> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<int> itemsPerOrder = cartOrderTimeToList();
    var saveCounter = 0;

    return Scaffold(
        body: Column(
      children: [
        Container(
          height: 100,
          color: AppColors.mainColor,
          width: double.maxFinite,
          padding: EdgeInsets.only(top: 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BigText(text: "Cart History", color: Colors.white),
              const AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: AppColors.mainColor),
            ],
          ),
        ),
        Expanded(
          child: Container(
              margin: EdgeInsets.only(
                top: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20,
              ),
              child: ListView(
                children: [
                  for (var i = 0; i < itemsPerOrder.length; i++)
                    Container(
                        margin: EdgeInsets.only(bottom: Dimensions.height20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BigText(text: "05/02/2021"),
                            ]))
                ],
              )),
        )
      ],
    ));
  }
}
