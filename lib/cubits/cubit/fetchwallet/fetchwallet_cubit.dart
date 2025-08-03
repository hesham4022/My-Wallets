import 'package:first_task/models/wallet_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'fetchwallet_state.dart';

class FetchwalletCubit extends Cubit<FetchwalletState> {
  FetchwalletCubit() : super(CardInitialState());
  void fetchAllWallets() {
    var walletsBox = Hive.box<WalletModel>('walletsBox');
    final wallets = walletsBox.values.toList();
    emit(CardSuccessState(wallets));
  }
}
