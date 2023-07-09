import 'package:dio/dio.dart';

import 'models/crypto_coin.dart';

class CryptoCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await Dio().get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,AVAX&tsyms=USD');
    final data = response.data as Map<String, dynamic>;
    final dataRAW = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinList = dataRAW.entries.map((e) {
      final usdData = (e.value as Map<String, dynamic>)['USD'];
      final name = e.key;
      final priceInUSD = usdData['PRICE'] as num;
      final imageURL = usdData['IMAGEURL'] as String;
      return CryptoCoin(
        name: name,
        priceInUSD: priceInUSD,
        imageURL: 'https://www.cryptocompare.com$imageURL',
      );
    }).toList();
    return cryptoCoinList;
  }
}
