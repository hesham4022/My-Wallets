import 'package:first_task/models/card_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'card_state.dart';

class CardCubit extends Cubit<CardState> {
  CardCubit() : super(CardInitialState());

  void fetchAllCards() {
    var cardsBox = Hive.box<CardModel>('cardsBox');
    final cards = cardsBox.values.toList();
    emit(CardSuccessState(cards));
  }
}
