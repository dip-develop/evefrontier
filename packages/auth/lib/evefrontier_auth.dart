library;

import 'package:logging/logging.dart';

import 'src/domain/interfaces/key_provider.dart';
import 'src/domain/models/models.dart';
import 'src/domain/usecases/auth_usecase.dart';

export 'src/data/entities/entities.dart';
export 'src/domain/models/models.dart';

class EVEFrontierAuth {
  /// Internal repository instance that handles all REST API operations
  late final AuthUsecase _auth;

  EVEFrontierAuth(
      {required Uri nonceEndpoint,
      required Uri authEndpoint,
      required KeyProvider keyProvider,
      Level? levelLog}) {
    // Initialize the REST repository implementation
    _auth = AuthUsecase();

    // Configure logging system
    Logger.root.level = levelLog ?? Level.OFF;
    Logger.root.onRecord.listen((record) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    });
  }

  Future<AuthResult> authenticate() => _auth.authenticate();
}
