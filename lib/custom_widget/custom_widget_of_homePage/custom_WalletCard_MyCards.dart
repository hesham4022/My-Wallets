import 'package:first_task/cubits/cubit/card_cubit/card_cubit.dart';
import 'package:first_task/models/card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletCard extends StatelessWidget {
  final Color color;
  final String amount;
  final String bank;
  final String cardNumber;
  final CardModel card;

  const WalletCard(
      {super.key,
      required this.color,
      required this.amount,
      required this.bank,
      required this.cardNumber,
      required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            amount,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.email_outlined, color: Colors.white),
                  SizedBox(width: 10),
                  IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.white,
                      onPressed: () {
                        card.delete();
                        BlocProvider.of<CardCubit>(context).fetchAllCards();
                      }),
                  SizedBox(width: 10),
                  Icon(Icons.edit, color: Colors.white),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(bank, style: TextStyle(color: Colors.white)),
                  Text(cardNumber,
                      style: TextStyle(color: Colors.white54, fontSize: 12)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
