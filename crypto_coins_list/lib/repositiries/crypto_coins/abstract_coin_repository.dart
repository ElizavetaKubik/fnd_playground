import 'crypto_coin.dart';

abstract class AbstractCoinRepository {
  Future<List<CryptoCoin>> getCoinsList();
}
