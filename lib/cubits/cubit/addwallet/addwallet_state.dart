part of 'addwallet_cubit.dart';

@immutable
sealed class AddwalletState {}

final class AddWalletInitial extends AddwalletState {}

final class AddWalletLaoding extends AddwalletState {}

final class AddWalletSuccess extends AddwalletState {}

final class AddWalletFailure extends AddwalletState {
  final String errorMessage;
  AddWalletFailure(this.errorMessage);
}
