import 'package:crypto_coins_list/repositiries/crypto_coins/crypto_coin.dart';

import 'package:flutter/material.dart';

import '../../../repositiries/crypto_coins/models/crypto_coin.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coin,
  });

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: Image.network(coin.imageUrl),
      trailing: const Icon(Icons.arrow_forward_ios),
      title: Text(
        coin.name,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        '${coin.priceInUSD}\$',
        style: theme.textTheme.labelSmall,
      ),
      onTap: () {
        // final coinDetails =
        //     await GetIt.I<AbstractCoinRepository>().getCoinsDetails(coin.name);
        Navigator.of(context).pushNamed('/coin', arguments: coin);
      },
    );
  }
}
