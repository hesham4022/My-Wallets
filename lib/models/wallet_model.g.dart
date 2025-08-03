// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WalletModelAdapter extends TypeAdapter<WalletModel> {
  @override
  final int typeId = 1;

  @override
  WalletModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WalletModel(
      id: fields[0] as String?,
      name: fields[1] as String,
      amount: fields[2] as double,
      createdAt: fields[3] as String,
      walletType: fields[4] as String,
      progress: fields[5] as double,
      colorValue: fields[6] as int,
      iconName: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, WalletModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.walletType)
      ..writeByte(5)
      ..write(obj.progress)
      ..writeByte(6)
      ..write(obj.colorValue)
      ..writeByte(7)
      ..write(obj.iconName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WalletModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
