import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositiries/crypto_coins/crypto_coin.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.coinRepository) : super(CryptoListInitial()) {
    on<LoadCryptoList>((event, emit) async {
      await _load(emit, event);
    });
  }

  Future<void> _load(
      Emitter<CryptoListState> emit, LoadCryptoList event) async {
    try {
      if (state is! CryptoListLoaded) {
        emit(CryptoListLoading());
      }

      final coinsList = await coinRepository.getCoinsList();
      emit(CryptoListLoaded(coinList: coinsList));
    } catch (e) {
      // print('e:$e');
      emit(CryptoListLoadingFailure(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  final AbstractCoinRepository coinRepository;
}
