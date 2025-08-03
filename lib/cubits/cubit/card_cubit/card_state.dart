part of 'card_cubit.dart';

@immutable
sealed class CardState {}

final class CardInitialState extends CardState {}

final class CardSuccessState extends CardState {
  final List<CardModel> cards;

  CardSuccessState(this.cards);
}
