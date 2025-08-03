import 'package:first_task/custom_widget/custom_wallet_page/circular_shape.dart';
import 'package:first_task/custom_widget/custom_wallet_page/custome_form_buttonsheet.dart';
import 'package:first_task/custom_widget/custom_widget_of_homePage/main_appBar.dart';
import 'package:first_task/main_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:first_task/cubits/cubit/fetchwallet/fetchwallet_cubit.dart';
import 'package:first_task/cubits/cubit/addwallet/addwallet_cubit.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      flaotAction: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: context.read<AddwalletCubit>()),
                    BlocProvider.value(value: context.read<FetchwalletCubit>()),
                  ],
                  child: WalletFormBottomSheet(
                    onSubmit: (updatedModel) {
                      context.read<FetchwalletCubit>().fetchAllWallets();
                    },
                  ),
                ),
              );
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
      selectedIndex: 2,
      onItemTap: (index) {
        if (index != 2) {
          Navigator.pushNamed(
            context,
            index == 0
                ? '/details'
                : index == 1
                    ? '/calendar'
                    : '/home',
          );
        }
      },
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            MainAppBar(),
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff292a3f),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(width: 25, height: 2, color: Colors.white),
                      SizedBox(height: 4),
                      Container(width: 15, height: 2, color: Colors.white),
                      SizedBox(height: 4),
                      Container(width: 5, height: 2, color: Colors.white),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.search,
                        size: 25,
                        color: Color.fromARGB(255, 193, 189, 189),
                      ),
                      hintText: "...Search Wallet",
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 193, 189, 189)),
                      filled: true,
                      fillColor: Color(0xff292a3f),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xff292a3f)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xff292a3f)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<FetchwalletCubit, FetchwalletState>(
                builder: (context, state) {
                  if (state is CardSuccessState) {
                    final wallets = state.wallets;
                    return ListView.builder(
                      itemCount: wallets.length,
                      itemBuilder: (context, index) {
                        final wallet = wallets[index];
                        return Container(
                          padding: EdgeInsets.all(16),
                          margin: EdgeInsets.only(bottom: 16),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xff2b426c),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.delete, color: Colors.red),
                                      SizedBox(width: 20),
                                      Icon(Icons.edit, color: Colors.red),
                                    ],
                                  ),
                                  SizedBox(height: 24),
                                  CircularShape(
                                      radius: 40,
                                      current: wallet.progress.toDouble()),
                                ],
                              ),
                              SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(wallet.name ?? 'بدون اسم',
                                      style: TextStyle(color: Colors.white)),
                                  SizedBox(height: 10),
                                  Text("${wallet.amount} ج.م",
                                      style: TextStyle(color: Colors.white)),
                                  Text(
                                      '${wallet.createdAt ?? 'تاريخ غير معروف'} :Created',
                                      style: TextStyle(color: Colors.white)),
                                  SizedBox(height: 10),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Color(0xff295185),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      wallet.walletType ?? 'غير محدد',
                                      style: TextStyle(
                                          color: Color(0xff408cc7),
                                          fontSize: 17),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Color(wallet.colorValue),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child:
                                        Icon(Icons.wallet, color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
