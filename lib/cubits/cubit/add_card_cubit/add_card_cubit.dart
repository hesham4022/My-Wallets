import 'package:bloc/bloc.dart';
import 'package:first_task/models/card_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'add_card_state.dart';

class AddCardCubit extends Cubit<AddCardState> {
  AddCardCubit() : super(AddCardInitial());
  Color color = Colors.cyan;
  int? currentIndex;
  addNote(CardModel card) async {
    card.color = color.value;
    emit(AddCardLaoding());
    try {
      var notesBox = Hive.box<CardModel>('cardsBox');
      emit(AddCardSuccess());
      await notesBox.add(card);
    } catch (e) {
      emit(AddCardFailure(e.toString()));
    }
  }
}
