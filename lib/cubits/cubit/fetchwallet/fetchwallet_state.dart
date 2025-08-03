part of 'fetchwallet_cubit.dart';

@immutable
sealed class FetchwalletState {}

final class CardInitialState extends FetchwalletState {}

final class CardSuccessState extends FetchwalletState {
  final List<WalletModel> wallets;

  CardSuccessState(this.wallets);
}
