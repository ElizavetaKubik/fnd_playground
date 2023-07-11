import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'app.dart';
import 'repositiries/crypto_coins/crypto_coin.dart';

void main() {
  final dio = Dio();
  dio.options.connectTimeout = const Duration(seconds: 5);
  // GetIt.I.registerSingleton(CryptoCoinsRepository(dio: Dio()));
  GetIt.I.registerLazySingleton<AbstractCoinRepository>(
      () => CryptoCoinsRepository(dio: dio));
  runApp(const CryptoCurrenciesListApp());
}
