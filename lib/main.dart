import 'package:first_task/cubits/cubit/add_card_cubit/add_card_cubit.dart';
import 'package:first_task/cubits/cubit/addwallet/addwallet_cubit.dart';
import 'package:first_task/cubits/cubit/card_cubit/card_cubit.dart';
import 'package:first_task/cubits/cubit/fetchwallet/fetchwallet_cubit.dart';
import 'package:first_task/models/card_model.dart';
import 'package:first_task/models/wallet_model.dart';
import 'package:first_task/screens/home_page.dart';
import 'package:first_task/screens/screens_of_NavBar_inHomePage/details_page.dart';
import 'package:first_task/screens/screens_of_NavBar_inHomePage/calender_page.dart';
import 'package:first_task/screens/screens_of_NavBar_inHomePage/nav_bar_screen.dart';

import 'package:first_task/screens/screens_of_NavBar_inHomePage/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CardModelAdapter());
  await Hive.openBox<CardModel>('cardsBox');

  await initializeDateFormatting('ar');

  Hive.registerAdapter(WalletModelAdapter());

  // 🧹 احذف بيانات المحفظة القديمة اللي فيها null

  await Hive.openBox<WalletModel>('walletsBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => AddCardCubit()),
        BlocProvider(
            create: (BuildContext context) => CardCubit()..fetchAllCards()),
        BlocProvider(create: (BuildContext context) => AddwalletCubit()),
        BlocProvider(
            create: (BuildContext context) =>
                FetchwalletCubit()..fetchAllWallets()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent, // يمنع الضوء عند الضغط
          splashColor: Colors.transparent, // يمنع الوميض
        ),
        initialRoute: '/navBar',
        routes: <String, WidgetBuilder>{
          '/navBar': (_) => NavBarPage(),
          '/home': (_) => const HomePage(),
          '/details': (_) => const DetailsPage(),
          '/calendar': (_) => const CalenderPage(),
          '/wallet': (_) => const WalletPage(),
        },
      ),
    );
  }
}
