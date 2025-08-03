import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key, this.icon});

  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff2d2d49),
      centerTitle: true,
      title: Text(
        "مذّخر",
        style: TextStyle(
          color: Color(0xFF00FF00),
          fontSize: 24,
          fontFamily: 'Cairo',
          letterSpacing: 1.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
