// importاتك عادية هنا
import 'package:first_task/screens/home_page.dart';
import 'package:first_task/screens/screens_of_NavBar_inHomePage/calender_page.dart';
import 'package:first_task/screens/screens_of_NavBar_inHomePage/details_page.dart';
import 'package:first_task/custom_widget/custom_wallet_page/custome_form_buttonsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:first_task/cubits/cubit/fetchwallet/fetchwallet_cubit.dart';
import 'package:first_task/cubits/cubit/addwallet/addwallet_cubit.dart';

import 'wallet_page.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({super.key});

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  int _selectedIndex = 2;

  static const List<Widget> _pages = <Widget>[
    DetailsPage(),
    CalenderPage(),
    WalletPage(),
    HomePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2d2d49),
      appBar: AppBar(
        backgroundColor: const Color(0xff2d2d49),
        centerTitle: true,
        title: const Text(
          "مذّخر",
          style: TextStyle(
            color: Color(0xFF00FF00),
            fontSize: 24,
            fontFamily: 'Cairo',
            letterSpacing: 1.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: const Icon(Icons.menu, color: Colors.white),
      ),
      body: _pages[_selectedIndex],
      floatingActionButton: _selectedIndex == 2
          ? FloatingActionButton(
              backgroundColor: const Color.fromRGBO(33, 150, 243, 1),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (_) => MultiBlocProvider(
                    providers: [
                      BlocProvider.value(value: context.read<AddwalletCubit>()),
                      BlocProvider.value(
                          value: context.read<FetchwalletCubit>()),
                    ],
                    child: WalletFormBottomSheet(
                      onSubmit: (updatedModel) {
                        context.read<FetchwalletCubit>().fetchAllWallets();
                      },
                    ),
                  ),
                );
              },
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xff24243e),
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF00FF00),
        unselectedItemColor: Colors.white70,
        selectedLabelStyle: const TextStyle(fontFamily: 'Cairo'),
        unselectedLabelStyle: const TextStyle(fontFamily: 'Cairo'),
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            label: 'التفاصيل',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_rounded),
            label: 'التقويم',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_rounded),
            label: 'المحافظ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'الرئيسية',
          ),
        ],
      ),
    );
  }
}
