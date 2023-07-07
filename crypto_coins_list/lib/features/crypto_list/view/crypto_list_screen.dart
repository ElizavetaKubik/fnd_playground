import 'package:crypto_coins_list/repositiries/crypto_coins/crypto_coins_repository.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Currencies List'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) =>
            const Divider(color: Colors.white24),
        itemBuilder: (context, index) {
          const coinName = 'Bitcoin';

          return const CryptoCoinTile(coinName: coinName);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CryptoCoinsRepository().getCoinsList();
        },
        child: Icon(
          Icons.download,
        ),
      ),
    );
  }
}
