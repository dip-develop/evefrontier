import 'dart:async';
import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:chopper_built_value/chopper_built_value.dart';

import '../../../domain/interfaces/rest_repo.dart';
import '../../entities/entities.dart';
import 'services/auth_service.dart';

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
  late final AuthService _game;

  /// Initializes the repository with a configured Chopper HTTP client.
  ///
  /// Sets up:
  /// - Base URL pointing to EVE Frontier World API
  /// - Bearer token authentication for protected endpoints
  /// - BuiltValue converter for automatic JSON serialization/deserialization
  /// - All three service instances (Meta, Game, Chain)
  /// - Request interceptors for common headers and logging
  ///
  /// Parameters:
  /// - [bearerToken]: Optional authentication token for accessing protected endpoints.
  ///   When provided, automatically adds Authorization header to all requests.
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
        AuthService.create(),
      ],
      // Request interceptors for common functionality
      interceptors: [
        _RestRequestInterceptor(),
        HttpLoggingInterceptor(), // Logs HTTP requests/responses
      ],
    );

    // Initialize service instances from the configured client
    _game = client.getService<AuthService>();
  }

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
  Future<T> _getData<T>(Response<T> response) {
    if (response.isSuccessful) {
      return Future<T>.value(response.body!);
    }
    return Future<T>.error(Exception(response.error));
  }
}

class _RestRequestInterceptor implements Interceptor {
  /// Creates an interceptor with optional authentication token
  const _RestRequestInterceptor();

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
      Chain<BodyType> chain) async {
    // Start with standard JSON accept header
    final headers = <String, String>{'accept': 'application/json'};
    // Add standard headers to the request
    final request = applyHeaders(chain.request, headers);

    // Continue the request chain with modified headers
    return chain.proceed(request);
  }
}
