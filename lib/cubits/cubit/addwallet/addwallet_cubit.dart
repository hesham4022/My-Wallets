import 'package:first_task/models/wallet_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'addwallet_state.dart';

class AddwalletCubit extends Cubit<AddwalletState> {
  AddwalletCubit() : super(AddWalletInitial());

  addWallet(WalletModel wallet) async {
    emit(AddWalletLaoding());
    try {
      var walletsBox = Hive.box<WalletModel>('walletsBox');
      emit(AddWalletSuccess());
      await walletsBox.add(wallet);
    } catch (e) {
      emit(AddWalletFailure(e.toString()));
    }
  }
}
