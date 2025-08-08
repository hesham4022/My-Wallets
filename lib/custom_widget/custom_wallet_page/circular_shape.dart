import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CircularShape extends StatelessWidget {
  final double current;
  final double radius;

  CircularShape({
    required this.current,
    required this.radius,
  });
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: radius,
      lineWidth: 5,
      percent: (current / Total2).clamp(0.0, 1.0),
      animation: true,
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: Colors.lightBlueAccent,
      backgroundColor: Colors.grey.shade800,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${((current / Total2) * 100).toStringAsFixed(1)}%",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

double Total2 = 7000;
