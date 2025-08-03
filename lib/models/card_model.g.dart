// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CardModelAdapter extends TypeAdapter<CardModel> {
  @override
  final int typeId = 0;

  @override
  CardModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CardModel(
      amount: fields[0] as double,
      bank: fields[1] as String,
      cardNumber: fields[2] as String,
      color: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CardModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.amount)
      ..writeByte(1)
      ..write(obj.bank)
      ..writeByte(2)
      ..write(obj.cardNumber)
      ..writeByte(3)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
