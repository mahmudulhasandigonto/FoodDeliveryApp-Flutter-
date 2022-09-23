import 'package:flutter/material.dart';
import 'package:practice_all/utils/dimensions.dart';

class SmallText extends StatelessWidget {
  String text;
  Color color;
  double size;
  double height;

  SmallText({
    Key? key,
    required this.text,
    this.color = const Color(0xFF8f837f),
    this.size = 0,
    this.height = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size == 0 ? Dimensions.font15 : size,
        color: color,
        fontFamily: 'Roboto-Regular',
        height: height,
      ),
    );
  }
}
