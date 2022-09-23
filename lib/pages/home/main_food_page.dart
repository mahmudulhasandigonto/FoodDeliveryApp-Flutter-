import 'package:flutter/material.dart';
import 'package:practice_all/pages/home/food_page_body.dart';
import 'package:practice_all/utils/colors.dart';
import 'package:practice_all/utils/dimensions.dart';
import 'package:practice_all/widgets/big_text.dart';
import 'package:practice_all/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    // To get the current device height and Width;
    // String data = "Current divice height is: ";
    // print(data + MediaQuery.of(context).size.height.toString());
    // print("Width is: " + MediaQuery.of(context).size.width.toString());
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Container(
              child: Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  padding: EdgeInsets.only(
                      left: Dimensions.width20, right: Dimensions.width20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          BigText(text: 'Bangladesh'),
                          Row(
                            children: [
                              SmallText(text: "Dhaka"),
                              SizedBox(width: Dimensions.font10),
                              const Icon(Icons.arrow_drop_down_rounded),
                            ],
                          ),
                        ],
                      ),
                      Center(
                        child: Container(
                          width: Dimensions.height45,
                          height: Dimensions.height45,
                          child: Icon(Icons.search,
                              color: Colors.white, size: Dimensions.iconSize24),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15),
                            color: AppColors.mainColor,
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          const Expanded(
              child: SingleChildScrollView(
            child: FoodPageBody(),
          )),
        ],
      ),
    );
  }
}
