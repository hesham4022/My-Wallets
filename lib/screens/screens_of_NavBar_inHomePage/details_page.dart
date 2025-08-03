import 'package:first_task/main_scaffold.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      selectedIndex: 0,
      onItemTap: (index) {
        if (index != 0) {
          Navigator.pushNamed(
            context,
            index == 1
                ? '/calendar'
                : index == 2
                    ? '/wallet'
                    : '/home',
          );
        }
      },
      body: const Center(
        child: Text(
          'صفحة التفاصيل',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
    );
  }
}
