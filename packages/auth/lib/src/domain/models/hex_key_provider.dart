import 'package:web3dart/web3dart.dart';

import '../interfaces/key_provider.dart';

class HexKeyProvider implements KeyProvider {
  final String hexKey;

  HexKeyProvider(this.hexKey);

  @override
  Future<EthPrivateKey> getCredentials() async => EthPrivateKey.fromHex(hexKey);
}
