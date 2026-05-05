import 'package:evefrontier_auth/evefrontier_auth.dart';
import 'package:logging/logging.dart';

/// Example demonstrating all EVE Frontier API operations.
///
/// This example shows how to use every available API endpoint,
/// including proper error handling and pagination usage.
///
/// To run this example:
/// ```bash
/// dart run example/evefrontier_api_example.dart
/// ```
void main() async {
  // Initialize API with detailed logging for debugging
  final keyProvider = HexKeyProvider(
    '0x0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef',
  );

  final auth = EVEFrontierAuth(
    nonceEndpoint: Uri.parse('https://api.example.com/nonce'),
    authEndpoint: Uri.parse('https://api.example.com/auth'),
    keyProvider: keyProvider,
    levelLog: Level.ALL,
  );
}
