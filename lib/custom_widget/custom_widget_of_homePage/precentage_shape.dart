import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BalanceIndicator extends StatelessWidget {
  final double current;
  final double radius;
  final String? desText;
  final String available;

  BalanceIndicator({
    required this.current,
    required this.radius,
    this.desText,
    required this.available,
  });
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: radius,
      lineWidth: 5,
      percent: current / Total,
      animation: true,
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: Colors.lightBlueAccent,
      backgroundColor: Colors.grey.shade800,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.visibility, color: Colors.grey.shade300),
          SizedBox(height: 5),
          Text(
            desText ?? "",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade300,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "$current",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

double Total = 7000;
