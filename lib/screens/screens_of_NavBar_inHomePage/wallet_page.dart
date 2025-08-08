import 'package:first_task/custom_widget/custom_wallet_page/circular_shape.dart';
import 'package:first_task/custom_widget/custom_wallet_page/custome_form_buttonsheet.dart';
import 'package:first_task/custom_widget/custom_widget_of_homePage/main_appBar.dart';
import 'package:first_task/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:first_task/cubits/cubit/fetchwallet/fetchwallet_cubit.dart';
import 'package:first_task/cubits/cubit/addwallet/addwallet_cubit.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text.toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff292a3f),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(width: 25, height: 2, color: Colors.white),
                    const SizedBox(height: 4),
                    Container(width: 15, height: 2, color: Colors.white),
                    const SizedBox(height: 4),
                    Container(width: 5, height: 2, color: Colors.white),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _searchController,
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.search,
                      size: 25,
                      color: Color.fromARGB(255, 193, 189, 189),
                    ),
                    hintText: "...Search Wallet",
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 193, 189, 189)),
                    filled: true,
                    fillColor: const Color(0xff292a3f),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xff292a3f)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xff292a3f)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: BlocBuilder<FetchwalletCubit, FetchwalletState>(
              builder: (context, state) {
                if (state is CardSuccessState) {
                  final allWallets = state.wallets;
                  final wallets = allWallets.where((w) {
                    final name = w.name.toLowerCase();
                    return _searchText.isEmpty
                        ? true
                        : name.contains(_searchText);
                  }).toList();

                  if (wallets.isEmpty) {
                    return const Center(
                      child: Text('لا توجد نتائج',
                          style: TextStyle(color: Colors.white)),
                    );
                  }

                  return ListView.builder(
                    itemCount: wallets.length,
                    itemBuilder: (context, index) {
                      final wallet = wallets[index];
                      return Container(
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.only(bottom: 16),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xff2b426c),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.delete),
                                        color: Colors.red,
                                        onPressed: () {
                                          wallet.delete();
                                          context
                                              .read<FetchwalletCubit>()
                                              .fetchAllWallets();
                                        },
                                      ),
                                      const SizedBox(width: 8),
                                      const Icon(Icons.edit, color: Colors.red),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  CircularShape(
                                    radius: 40,
                                    current: wallet.amount,
                                  ),
                                ],
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      wallet.name.isEmpty
                                          ? 'بدون اسم'
                                          : wallet.name,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "${wallet.amount} ج.م",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      '${formatCreatedAtArabic(wallet.createdAt)} :Created',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: const Color(0xff295185),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        wallet.walletType.isEmpty
                                            ? 'غير محدد'
                                            : wallet.walletType,
                                        style: const TextStyle(
                                            color: Color(0xff408cc7),
                                            fontSize: 17),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Color(wallet.colorValue),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: const Icon(Icons.wallet,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ));
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
