// lib/layouts/main_scaffold.dart
import 'package:first_task/custom_widget/custom_widget_of_homePage/navBar_Home_Page.dart';
import 'package:flutter/material.dart';

class MainScaffold extends StatelessWidget {
  final Widget body;
  final int selectedIndex;
  final Function(int) onItemTap;
  final Widget? flaotAction;
  const MainScaffold({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onItemTap,
    this.flaotAction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: flaotAction,
      backgroundColor: const Color(0xff2d2d49),
      body: body,
      bottomNavigationBar: CustomNavBar(
        selectedIndex: selectedIndex,
        onItemTap: onItemTap,
      ),
    );
  }
}
