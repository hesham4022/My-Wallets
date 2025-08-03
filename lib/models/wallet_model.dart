import 'package:hive/hive.dart';

part 'wallet_model.g.dart';

@HiveType(typeId: 1)
class WalletModel extends HiveObject {
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final double amount;

  @HiveField(3)
  final String createdAt;

  @HiveField(4)
  final String walletType;

  @HiveField(5)
  final double progress;

  @HiveField(6)
  final int colorValue;

  @HiveField(7)
  final String? iconName;

  WalletModel({
    this.id,
    required this.name,
    required this.amount,
    required this.createdAt,
    required this.walletType,
    required this.progress,
    required this.colorValue,
    this.iconName,
  });
}
