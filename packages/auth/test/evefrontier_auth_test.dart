import 'package:evefrontier_auth/evefrontier_auth.dart';
import 'package:logging/logging.dart';
import 'package:test/test.dart';

void main() {
  late EVEFrontierAuth auth;

  setUpAll(() {
    final keyProvider = HexKeyProvider(
      '0x0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef',
    );

    auth = EVEFrontierAuth(
        nonceEndpoint: Uri.parse('https://api.example.com/nonce'),
        authEndpoint: Uri.parse('https://api.example.com/auth'),
        keyProvider: keyProvider,
        levelLog: Level.ALL);
  });
}
