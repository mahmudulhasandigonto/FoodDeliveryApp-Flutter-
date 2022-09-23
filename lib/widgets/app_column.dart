import 'package:flutter/material.dart';
import 'package:practice_all/utils/colors.dart';
import 'package:practice_all/utils/dimensions.dart';
import 'package:practice_all/widgets/big_text.dart';
import 'package:practice_all/widgets/icon_and_text_widget.dart';
import 'package:practice_all/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      BigText(text: text, size: Dimensions.font26),
      SizedBox(height: Dimensions.font10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            children: List.generate(
              5,
              (index) => Icon(Icons.star,
                  color: AppColors.mainColor, size: Dimensions.iconSize24),
            ),
          ),
          // const SizedBox(width: 10),
          SmallText(text: '4.5'),
          // const SizedBox(width: 10),
          SmallText(text: '1287'),
          // const SizedBox(width: 10),
          SmallText(text: 'comments'),
        ],
      ),
      SizedBox(
        height: Dimensions.height20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          IconAndTextWidget(
            icon: Icons.circle_sharp,
            text: 'Normal',
            iconColor: AppColors.iconColor1,
          ),
          // SizedBox(width: 10),
          IconAndTextWidget(
            icon: Icons.location_on,
            text: '1.7km',
            iconColor: AppColors.iconColor1,
          ),
          // SizedBox(width: 10),
          IconAndTextWidget(
            icon: Icons.access_time_rounded,
            text: '32min',
            iconColor: AppColors.iconColor1,
          ),
        ],
      ),
    ]);
  }
}
