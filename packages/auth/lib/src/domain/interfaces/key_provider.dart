import 'package:web3dart/web3dart.dart';

abstract interface class KeyProvider {
  Future<EthPrivateKey> getCredentials();
}
