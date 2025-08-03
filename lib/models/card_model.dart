import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'card_model.g.dart';

@HiveType(typeId: 0)
class CardModel extends HiveObject {
  @HiveField(0)
  final double amount;

  @HiveField(1)
  final String bank;

  @HiveField(2)
  final String cardNumber;

  @HiveField(3)
  int color;

  CardModel({
    required this.amount,
    required this.bank,
    required this.cardNumber,
    required this.color,
  });
}
