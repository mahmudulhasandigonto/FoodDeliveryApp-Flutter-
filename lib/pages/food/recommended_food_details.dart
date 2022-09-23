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
import 'package:practice_all/widgets/expandable_text_widget.dart';

class RecommendedFoodDetails extends StatelessWidget {
  final int pageId;
  final String page;
  const RecommendedFoodDetails(
      {Key? key, required this.pageId, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        if (page == "cartpage") {
                          Get.toNamed(RouteHelper.getCartPage());
                        } else {
                          Get.toNamed(RouteHelper.getInitial());
                        }
                      },
                      child: AppIcon(icon: Icons.clear)),
                  // AppIcon(icon: Icons.shopping_cart_outlined),
                  GetBuilder<PopularProductController>(builder: (controller) {
                    return GestureDetector(
                      onTap: () {
                        if (controller.totalItems >= 1)
                          Get.toNamed(RouteHelper.getCartPage());
                      },
                      child: Stack(
                        children: [
                          AppIcon(icon: Icons.add_shopping_cart_outlined),
                          controller.totalItems >= 1
                              ? Positioned(
                                  top: 0,
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.toNamed(RouteHelper.getCartPage());
                                    },
                                    child: const AppIcon(
                                        icon: Icons.circle,
                                        size: 20,
                                        iconColor: Colors.transparent,
                                        backgroundColor: AppColors.mainColor),
                                  ),
                                )
                              : Container(),
                          Positioned(
                            right: 4,
                            top: 3,
                            child: BigText(
                              text: Get.find<PopularProductController>()
                                  .totalItems
                                  .toString(),
                              size: 12,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                ]),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                alignment: Alignment.center,
                child: BigText(size: Dimensions.font26, text: product.name),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.white,
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                  AppConstants.BASE_URL +
                      AppConstants.UPLOAD_URL +
                      product.img!,
                  width: double.maxFinite,
                  fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                child: ExpandableTextWidget(text: product.description),
                margin: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
              )
            ],
          ))
        ],
      ),
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (controller) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20 * 2.5,
                right: Dimensions.width20 * 2.5,
                top: Dimensions.height10,
                bottom: Dimensions.height10,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(false);
                      },
                      child: AppIcon(
                          iconSize: Dimensions.iconSize24,
                          iconColor: Colors.white,
                          backgroundColor: AppColors.mainColor,
                          icon: Icons.remove),
                    ),
                    BigText(
                        text:
                            " \$ ${product.price}  X  ${controller.inCartItems} ",
                        color: AppColors.mainBlackColor,
                        size: Dimensions.font26),
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(true);
                      },
                      child: AppIcon(
                          iconSize: Dimensions.iconSize24,
                          iconColor: Colors.white,
                          backgroundColor: AppColors.mainColor,
                          icon: Icons.add),
                    ),
                  ]),
            ),
            Container(
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
                    child: const Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                    ),
                  ),
                  Container(
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
                        controller.addItem(product);
                      },
                      child: BigText(
                          text: "\$ ${product.price}  | Add to cart",
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
