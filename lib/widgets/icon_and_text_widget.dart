import 'package:flutter/material.dart';
import 'package:practice_all/utils/dimensions.dart';
import 'package:practice_all/widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  final Color iconColor;
  const IconAndTextWidget(
      {Key? key,
      required this.icon,
      required this.text,
      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: Dimensions.iconSize24,
          color: iconColor,
        ),
        const SizedBox(width: 2),
        SmallText(text: text),
      ],
    );
  }
}
