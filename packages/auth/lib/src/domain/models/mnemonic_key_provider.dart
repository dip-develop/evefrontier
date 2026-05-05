import 'package:web3dart/web3dart.dart';
import 'package:bip39/bip39.dart';

import '../interfaces/key_provider.dart';

class MnemonicKeyProvider implements KeyProvider {
  final String mnemonic;
  final int index;

  MnemonicKeyProvider(this.mnemonic, {this.index = 0});

  @override
  Future<EthPrivateKey> getCredentials() async {
    final seed = mnemonicToSeed(mnemonic);
    final pkBytes = seed.sublist(0, 32);
    return EthPrivateKey(pkBytes);
  }
}
