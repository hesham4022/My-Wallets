part of 'add_card_cubit.dart';

@immutable
sealed class AddCardState {}

final class AddCardInitial extends AddCardState {}

final class AddCardLaoding extends AddCardState {}

final class AddCardSuccess extends AddCardState {}

final class AddCardFailure extends AddCardState {
  final String errorMessage;
  AddCardFailure(this.errorMessage);
}
