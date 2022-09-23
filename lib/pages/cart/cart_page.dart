import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_all/controllers/cart_controller.dart';
import 'package:practice_all/controllers/popular_product_controller.dart';
import 'package:practice_all/controllers/recommended_product_controller.dart';
import 'package:practice_all/routes/route_helper.dart';
import 'package:practice_all/utils/app_constants.dart';
import 'package:practice_all/utils/colors.dart';
import 'package:practice_all/utils/dimensions.dart';
import 'package:practice_all/widgets/app_icon.dart';
import 'package:practice_all/widgets/big_text.dart';
import 'package:practice_all/widgets/small_text.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Positioned(
                top: Dimensions.height20 * 3,
                left: Dimensions.width20,
                right: Dimensions.width20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Get.to(() => RecommendedFoodDetails());
                      },
                      child: AppIcon(
                        icon: Icons.arrow_back_ios,
                        iconColor: Colors.white,
                        backgroundColor: AppColors.mainColor,
                        iconSize: Dimensions.iconSize24,
                      ),
                    ),
                    SizedBox(width: Dimensions.width20 * 5),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getInitial());
                      },
                      child: AppIcon(
                        icon: Icons.home_outlined,
                        iconColor: Colors.white,
                        backgroundColor: AppColors.mainColor,
                        iconSize: Dimensions.iconSize24,
                      ),
                    ),
                    AppIcon(
                      icon: Icons.shopping_cart_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ],
                )),
            Positioned(
              top: Dimensions.height20 * 5,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: 0,
              child: Container(
                  margin: EdgeInsets.only(top: Dimensions.height15),
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: GetBuilder<CartController>(
                      builder: (cartController) {
                        var _cartList = cartController.getItems;
                        return ListView.builder(
                            itemCount: _cartList.length,
                            itemBuilder: (_, index) {
                              return Container(
                                  width: double.maxFinite,
                                  height: 100, //
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          var popularIndex = Get.find<
                                                  PopularProductController>()
                                              .popularProductList
                                              .indexOf(
                                                  _cartList[index].product);

                                          if (popularIndex >= 0) {
                                            Get.toNamed(
                                                RouteHelper.getPopularFood(
                                                    popularIndex, "cartpage"));
                                          } else {
                                            var recommendedIndex = Get.find<
                                                    RecommendedProductController>()
                                                .recommendedProductList
                                                .indexOf(
                                                    _cartList[index].product);
                                            Get.toNamed(
                                                RouteHelper.getRecommendedFood(
                                                    recommendedIndex,
                                                    "cartpage"));
                                          }
                                        },
                                        child: Container(
                                          width: Dimensions.width20 * 5,
                                          height: Dimensions.height20 * 5,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      AppConstants.BASE_URL +
                                                          AppConstants
                                                              .UPLOAD_URL +
                                                          cartController
                                                              .getItems[index]
                                                              .img!)),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                Dimensions.radius20,
                                              ),
                                              color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(width: Dimensions.width10),
                                      Expanded(
                                          child: Container(
                                        height: Dimensions.height20 * 5,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            BigText(
                                                text: cartController
                                                    .getItems[index].name!,
                                                color: Colors.black54),
                                            SmallText(text: "Bitter"),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  BigText(
                                                    text: _cartList[index]
                                                        .price
                                                        .toString(),
                                                    color: Colors.redAccent,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        top:
                                                            Dimensions.height10,
                                                        bottom:
                                                            Dimensions.height10,
                                                        left:
                                                            Dimensions.width10,
                                                        right:
                                                            Dimensions.width10),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              Dimensions
                                                                  .radius20),
                                                      color: Colors.white,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            cartController.addItems(
                                                                _cartList[index]
                                                                    .product!,
                                                                -1);
                                                          },
                                                          child: const Icon(
                                                              Icons.remove,
                                                              color: AppColors
                                                                  .signColor),
                                                        ),
                                                        SizedBox(
                                                            width: Dimensions
                                                                    .width10 /
                                                                2),
                                                        BigText(
                                                            text: _cartList[
                                                                    index]
                                                                .quantity
                                                                .toString()),
                                                        SizedBox(
                                                            width: Dimensions
                                                                    .width10 /
                                                                2),
                                                        GestureDetector(
                                                          onTap: () {
                                                            cartController.addItems(
                                                                _cartList[index]
                                                                    .product!,
                                                                1);
                                                          },
                                                          child: const Icon(
                                                              Icons.add,
                                                              color: AppColors
                                                                  .signColor),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ])
                                          ],
                                        ),
                                      )),
                                    ],
                                  ));
                            });
                      },
                    ),
                  )),
            ),
          ],
        ),
        bottomNavigationBar:
            GetBuilder<CartController>(builder: (cartController) {
          return Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
                top: Dimensions.height30,
                left: Dimensions.width20,
                right: Dimensions.width20,
                bottom: Dimensions.height30),
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 * 2),
                topRight: Radius.circular(Dimensions.radius20 * 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: Dimensions.width10 / 2),
                      BigText(
                          text: "\$ " + cartController.totalAmount.toString()),
                      SizedBox(width: Dimensions.width10 / 2),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height20,
                        bottom: Dimensions.height20,
                        left: Dimensions.width20,
                        right: Dimensions.width20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor,
                    ),
                    child: GestureDetector(
                        onTap: () {
                          cartController.addToHistory();
                        },
                        child: BigText(text: "Check Out", color: Colors.white)),
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
