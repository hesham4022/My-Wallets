import 'package:first_task/cubits/cubit/card_cubit/card_cubit.dart';
import 'package:first_task/custom_widget/custom_widget_of_homePage/button_sheet.dart';
import 'package:first_task/custom_widget/custom_widget_of_homePage/custom_WalletCard_MyCards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Mycards extends StatelessWidget {
  const Mycards({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CardCubit>().fetchAllCards(); // ✅

    return Scaffold(
      backgroundColor: const Color(0xff2d2d49),
      body: Column(
        children: [
          const SizedBox(height: 10),
          const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "انقر مرتين على البطاقة لتحديدها",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(width: 8),
                Icon(Icons.touch_app, color: Colors.white),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: BlocBuilder<CardCubit, CardState>(
                builder: (context, state) {
                  if (state is CardSuccessState) {
                    final cards = state.cards;
                    if (cards.isEmpty) {
                      return const Center(
                        child: Text("لا توجد بطاقات حالياً",
                            style: TextStyle(color: Colors.white)),
                      );
                    }
                    return ListView.builder(
                      itemCount: cards.length,
                      itemBuilder: (context, index) {
                        final card = cards[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: WalletCard(
                            color: Color(card.color),
                            amount: "${card.amount} ج.م",
                            bank: card.bank,
                            cardNumber: card.cardNumber,
                            card: card,
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => const AddBottomsheet(),
          );
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
