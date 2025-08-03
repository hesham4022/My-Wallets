import 'package:flutter/material.dart';

class Custom_Card extends StatelessWidget {
  String textcard;
  Icon iconcard;
  Custom_Card({
    super.key,
    required this.textcard,
    required this.iconcard,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Color(0xff444362),
              borderRadius: BorderRadius.circular(10),
            ),
            child: iconcard,
          ),
        ),
        Text(
          textcard,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
