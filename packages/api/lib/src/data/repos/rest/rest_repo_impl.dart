import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:chopper_built_value/chopper_built_value.dart';

import '../../../../evefrontier_api.dart';
import '../../../domain/interfaces/rest_repo.dart';
import 'services/chain_service.dart';
import 'services/game_service.dart';
import 'services/meta_service.dart';

/// Concrete implementation of [RestRepo] interface using the Chopper HTTP client library.
///
/// This class serves as the data layer implementation that handles all REST API
/// communication with the EVE Frontier World API. It orchestrates three specialized
/// service clients (MetaService, GameService, ChainService) and provides unified
/// access through the repository pattern.
///
/// Key responsibilities:
/// - HTTP client configuration and management
/// - Request/response serialization using BuiltValue
/// - Error handling and response processing
/// - Service composition and delegation
/// - Request interception for common headers
///
/// The implementation automatically handles:
/// - JSON serialization/deserialization
/// - HTTP logging for debugging
/// - Standard error response processing
/// - Base URL configuration for the EVE Frontier API
class RestRepoImpl implements RestRepo {
  /// Service instance for meta operations (configuration, health, POD verification)
  late final MetaService _meta;

  /// Service instance for game operations (fuels, jumps, scans, solar systems, types)
  late final GameService _game;

  /// Service instance for chain operations (kill mails, smart assemblies, smart characters, meta transactions)
  late final ChainService _chain;

  /// Initializes the repository with a configured Chopper HTTP client.
  ///
  /// Sets up:
  /// - Base URL pointing to EVE Frontier World API
  /// - BuiltValue converter for automatic JSON serialization/deserialization
  /// - All three service instances (Meta, Game, Chain)
  /// - Request interceptors for common headers and logging
  ///
  /// The client is configured to handle entity serialization automatically
  /// and includes HTTP logging for development and debugging purposes.
  RestRepoImpl() {
    final client = ChopperClient(
      // EVE Frontier World API base URL for all requests
      baseUrl:
          Uri.tryParse('https://world-api-stillness.live.tech.evefrontier.com'),
      // BuiltValue converter for automatic JSON serialization of entities
      converter: BuiltValueConverter(entitySerializers),
      // BuiltValue converter for error response deserialization
      errorConverter: BuiltValueConverter(entitySerializers),
      // Register all service classes for dependency injection
      services: [
        MetaService.create(),
        ChainService.create(),
        GameService.create(),
      ],
      // Request interceptors for common functionality
      interceptors: [
        _RestRequestInterceptor(), // Adds standard headers
        HttpLoggingInterceptor(), // Logs HTTP requests/responses
      ],
    );

    // Initialize service instances from the configured client
    _meta = client.getService<MetaService>();
    _game = client.getService<GameService>();
    _chain = client.getService<ChainService>();
  }

  //
  // Meta Service Operations
  // Delegates to MetaService for configuration and system health operations
  //

  @override
  Future<AbiConfigEntity> getABISConfig() =>
      _meta.getABISConfig().then(_getData);

  @override
  Future<BuiltList<ChainConfigEntity>> getConfig() =>
      _meta.getConfig().then(_getData);

  @override
  Future<HealthyEntity> getHealth() => _meta.getHealth().then(_getData);

  @override
  Future<VerifyResponseEntry> verifyPod(PodEntity pod) =>
      _meta.verifyPod(pod).then(_getData).catchError((error) {
        return error is Exception
            ? Future<VerifyResponseEntry>.error(error)
            : Future<VerifyResponseEntry>.error(Exception('Unknown error'));
      });

  //
  // Game Service Operations
  // Delegates to GameService for game-specific data and user activities
  //

  @override
  Future<PaginationDataEntity<FuelEntity>> getFuels(
          {int? limit, int? offset}) =>
      _game.getFuels(limit: limit, offset: offset).then(_getData);

  @override
  Future<PaginationDataEntity<JumpEntity>> getJumps(
          {int? limit, int? offset}) =>
      _game.getMeJumps(limit: limit, offset: offset).then(_getData);

  @override
  Future<JumpEntity> getJump(String id) => _game.getMeJump(id).then(_getData);

  @override
  Future<PaginationDataEntity<ScanEntity>> getScans(
          {int? limit, int? offset}) =>
      _game.getMeScans(limit: limit, offset: offset).then(_getData);

  @override
  Future<ScanEntity> getScan(String id) => _game.getMeScan(id).then(_getData);

  @override
  Future<PaginationDataEntity<SolarSystemEntity>> getSolarSystems() =>
      _game.getSolarSystems().then(_getData);

  @override
  Future<SolarSystemEntity> getSolarSystem(String id) =>
      _game.getSolarSystem(id).then(_getData);

  @override
  Future<PaginationDataEntity<TypeEntity>> getTypes() =>
      _game.getTypes().then(_getData);

  @override
  Future<TypeEntity> getType(String id) => _game.getType(id).then(_getData);

  //
  // Chain Service Operations
  // Delegates to ChainService for blockchain-related data and transactions
  //

  @override
  Future<PaginationDataEntity<KillMailEntity>> getKillMails(
          {int? limit, int? offset}) =>
      _chain.getKillMails(limit: limit, offset: offset).then(_getData);

  @override
  Future<KillMailEntity> getKillMail(String id) =>
      _chain.getKillMail(id).then(_getData);

  @override
  Future<SmartAssemblyEntity> getSmartAssemblie(String id) =>
      _chain.getSmartAssemblie(id).then(_getData);

  @override
  Future<PaginationDataEntity<SmartAssemblyEntity>> getSmartAssemblies(
          {int? limit, int? offset}) =>
      _chain.getSmartAssemblies(limit: limit, offset: offset).then(_getData);

  @override
  Future<PaginationDataEntity<SmartCharacterEntity>> getSmartCharacters(
          {int? limit, int? offset}) =>
      _chain.getSmartCharacters(limit: limit, offset: offset).then(_getData);

  @override
  Future<SmartCharacterEntity> getSmartCharacter(String id) =>
      _chain.getSmartCharacter(id).then(_getData);

  @override
  Future<void> metaTransaction(ErcEntity erc) =>
      _chain.metaTransaction(erc).then(_getData);

  /// Extracts successful response data or converts HTTP errors to Dart exceptions.
  ///
  /// This method provides unified error handling across all API operations:
  /// - For successful responses (2xx status codes): returns the response body
  /// - For error responses: converts HTTP errors to Dart exceptions with error details
  ///
  /// Type parameter [T] ensures type safety for the extracted data.
  ///
  /// Parameters:
  /// - [response]: HTTP response wrapper containing status and body data
  ///
  /// Returns the response body for successful requests, or throws an exception for errors.
  FutureOr<T> _getData<T>(Response<T> response) {
    if (response.isSuccessful) {
      return response.body!;
    }
    return Future<T>.error(Exception(response.error));
  }
}

/// HTTP request interceptor that adds standard headers to all outgoing requests.
///
/// This interceptor ensures consistent request formatting by automatically adding:
/// - Accept header with 'application/json' to indicate expected response format
/// - Any future standard headers required by the EVE Frontier API
///
/// The interceptor runs before each request is sent, allowing for global
/// request modification without duplicating header logic across services.
class _RestRequestInterceptor implements Interceptor {
  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
      Chain<BodyType> chain) async {
    // Add standard JSON accept header to all requests
    final request = applyHeaders(chain.request, {'accept': 'application/json'});

    // Continue the request chain with modified headers
    return chain.proceed(request);
  }
}
