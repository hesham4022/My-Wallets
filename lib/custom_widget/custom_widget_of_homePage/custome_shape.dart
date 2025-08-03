import 'package:first_task/custom_widget/custom_widget_of_homePage/circlepainter.dart';
import 'package:flutter/material.dart';

class CustomShape extends StatelessWidget {
  final Color color;
  String text;
  double width;
  CustomShape(
      {super.key,
      required this.color,
      required this.width,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: width,
      decoration: BoxDecoration(
        color: Color(0xff3b3a5a),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: TextStyle(color: Colors.white)),
          SizedBox(width: 8),
          GlowingHexagon(color: color),
        ],
      ),
    );
  }
}
