import 'package:chopper/chopper.dart';

part 'auth_service.chopper.dart';

@ChopperApi()

/// GameService provides API endpoints for retrieving game-related data from EVE Frontier World API.
///
/// This service handles:
/// - Fuel information for smart assemblies
/// - User-specific jump history and details
/// - User-specific scan history and details
/// - Solar system information and details
/// - Game type information and details
///
/// Most endpoints support pagination through limit/offset parameters.
/// User-specific endpoints require authentication via Bearer token.
abstract class AuthService extends ChopperService {
  /// Creates an instance of GameService with optional ChopperClient
  static AuthService create([ChopperClient? client]) => _$AuthService(client);


}
