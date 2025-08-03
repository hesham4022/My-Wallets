import 'package:first_task/main_scaffold.dart';
import 'package:flutter/material.dart';

class CalenderPage extends StatelessWidget {
  const CalenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      selectedIndex: 1,
      onItemTap: (index) {
        if (index != 1) {
          Navigator.pushNamed(
            context,
            index == 0
                ? '/details'
                : index == 2
                    ? '/wallet'
                    : '/home',
          );
        }
      },
      body: const Center(
        child: Text(
          'صفحة التقويم',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
    );
  }
}
