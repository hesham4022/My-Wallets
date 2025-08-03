import 'package:first_task/screens/home_page.dart';
import 'package:first_task/screens/screens_of_NavBar_inHomePage/calender_page.dart';
import 'package:first_task/screens/screens_of_NavBar_inHomePage/details_page.dart';
import 'package:first_task/screens/screens_of_NavBar_inHomePage/wallet_page.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTap;

  const CustomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items = [
      {
        'icon': Icons.list_alt_rounded,
        'label': 'التفاصيل',
        'page': const DetailsPage(),
      },
      {
        'icon': Icons.calendar_today_rounded,
        'label': 'التقويم',
        'page': const CalenderPage(),
      },
      {
        'icon': Icons.account_balance_wallet_rounded,
        'label': 'المحافظ',
        'page': const WalletPage(),
      },
      {
        'icon': Icons.home_rounded,
        'label': 'الرئيسية',
        'page': const HomePage(),
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xff2c2c4e),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 8),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          items.length,
          (index) {
            final isSelected = index == selectedIndex;
            return GestureDetector(
              onTap: () {
                onItemTap(index);

                if (index != selectedIndex) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => items[index]['page'],
                    ),
                  );
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: isSelected
                    ? BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(30),
                      )
                    : null,
                child: Row(
                  children: [
                    if (isSelected && items[index]['label'] != '')
                      Text(
                        items[index]['label'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    if (isSelected && items[index]['label'] != '')
                      const SizedBox(width: 6),
                    Icon(
                      items[index]['icon'],
                      color: Colors.white,
                      size: 24,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
