import 'package:first_task/custom_widget/custom_widget_of_homePage/main_appBar.dart';
import 'package:first_task/main_scaffold.dart';
import 'package:first_task/screens/myCards.dart';
import 'package:first_task/screens/my_wallets_InHomePage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _currentIndex = 3;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      selectedIndex: _currentIndex,
      onItemTap: (index) {
        if (index == 3) {
          _tabController.animateTo(0);
          setState(() {
            _currentIndex = 3;
          });
        } else {
          // باقي الصفحات
          Navigator.pushNamed(
            context,
            index == 0
                ? '/details'
                : index == 1
                    ? '/calendar'
                    : '/wallet',
          );
        }
      },
      body: Column(
        children: [
          MainAppBar(
            icon: Icons.person,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: const Color(0xff292a3f),
              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    color: const Color(0xff2d2d49),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  dividerColor: Colors.transparent,
                  tabs: const [
                    Tab(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          "محافظي",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          "بطاقاتي",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                MyWalletsInhomepage(),
                Mycards(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
