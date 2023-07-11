part of 'crypto_list_bloc.dart';

abstract class CryptoListState {}

class CryptoListInitial extends CryptoListState {}

class CryptoListLoading extends CryptoListState {}

class CryptoListLoaded extends CryptoListState {
  CryptoListLoaded({required this.coinList});

  final List<CryptoCoin> coinList;
}

class CryptoListLoadingFailure extends CryptoListState {
  CryptoListLoadingFailure({required this.exception});

  final Object? exception;
}
