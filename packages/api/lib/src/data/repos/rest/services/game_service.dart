import 'package:chopper/chopper.dart';

import '../../../../../evefrontier_api.dart';

part 'game_service.chopper.dart';

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
abstract class GameService extends ChopperService {
  /// Creates an instance of GameService with optional ChopperClient
  static GameService create([ChopperClient? client]) => _$GameService(client);

  /// Retrieves all available fuels for smart assemblies
  ///
  /// Returns paginated list of [FuelEntity] containing:
  /// - efficiency: Fuel efficiency rating
  /// - type: Associated TypeEntity with fuel details
  ///
  /// Query Parameters:
  /// - [limit]: Maximum number of fuels to return (optional)
  /// - [offset]: Number of fuels to skip before collecting results (optional)
  ///
  /// HTTP Status Codes:
  /// - 200: Fuels with metadata successfully retrieved
  /// - 500: Internal Server Error
  @GET(path: '/v2/fuels')
  Future<Response<PaginationDataEntity<FuelEntity>>> getFuels(
      {@Query() int? limit, @Query() int? offset});

  /// Retrieves jump history for the authenticated user's smart character
  ///
  /// **Requires Authentication**: Bearer token must be provided in Authorization header
  ///
  /// Returns paginated list of [JumpEntity] containing:
  /// - id: Jump ID (currently uses jump time as UNIX ms timestamp)
  /// - destination: Target solar system information
  /// - origin: Source solar system information
  /// - ship: Ship information (instanceId, typeId)
  /// - time: Jump timestamp
  ///
  /// Query Parameters:
  /// - [limit]: Maximum number of jumps to return (optional)
  /// - [offset]: Number of jumps to skip before collecting results (optional)
  ///
  /// HTTP Status Codes:
  /// - 200: Jumps with metadata successfully retrieved
  /// - 401: Unauthorized (missing or invalid Bearer token)
  /// - 500: Internal Server Error
  @GET(path: '/v2/smartcharacters/me/jumps')
  Future<Response<PaginationDataEntity<JumpEntity>>> getMeJumps(
      {@Query() int? limit, @Query() int? offset});

  /// Retrieves a specific jump by ID for the authenticated user's smart character
  ///
  /// **Requires Authentication**: Bearer token must be provided in Authorization header
  ///
  /// Parameters:
  /// - [id]: Jump ID (example: "1745854210705")
  ///
  /// Returns [JumpEntity] with detailed jump information including:
  /// - destination and origin solar systems
  /// - ship details
  /// - jump timestamp
  ///
  /// HTTP Status Codes:
  /// - 200: Jump details successfully retrieved
  /// - 201: When generating a POD (with ?format=pod query parameter)
  /// - 400: Bad Request
  /// - 401: Unauthorized (missing or invalid Bearer token)
  /// - 500: Internal Server Error
  @GET(path: '/v2/smartcharacters/me/jumps/{id}')
  Future<Response<JumpEntity>> getMeJump(@Path() String id);

  /// Retrieves scan history for the authenticated user's smart character
  ///
  /// **Requires Authentication**: Bearer token must be provided in Authorization header
  /// **Note**: Currently returns mocked data
  ///
  /// Returns paginated list of [ScanEntity] containing:
  /// - id: Scan ID
  /// - location: Solar system where scan was performed
  /// - scannedObject: Information about scanned object (mass, name, owner, typeID)
  /// - time: Scan timestamp
  ///
  /// Query Parameters:
  /// - [limit]: Maximum number of scans to return (optional)
  /// - [offset]: Number of scans to skip before collecting results (optional)
  ///
  /// HTTP Status Codes:
  /// - 200: Scans with metadata successfully retrieved
  /// - 401: Unauthorized (missing or invalid Bearer token)
  /// - 500: Internal Server Error
  @GET(path: '/v2/smartcharacters/me/scans')
  Future<Response<PaginationDataEntity<ScanEntity>>> getMeScans(
      {@Query() int? limit, @Query() int? offset});

  /// Retrieves a specific scan by ID for the authenticated user's smart character
  ///
  /// **Requires Authentication**: Bearer token must be provided in Authorization header
  /// **Note**: Currently returns mocked data
  ///
  /// Parameters:
  /// - [id]: Scan ID (example: "690152")
  ///
  /// Returns [ScanEntity] with detailed scan information including:
  /// - location details
  /// - scanned object information
  /// - scan timestamp
  ///
  /// HTTP Status Codes:
  /// - 200: Scan details successfully retrieved
  /// - 201: When generating a POD (with ?format=pod query parameter)
  /// - 400: Bad Request
  /// - 401: Unauthorized (missing or invalid Bearer token)
  /// - 500: Internal Server Error
  @GET(path: '/v2/smartcharacters/me/scans/{id}')
  Future<Response<ScanEntity>> getMeScan(@Path() String id);

  /// Retrieves all solar systems currently available in the game
  ///
  /// Returns paginated list of [SolarSystemEntity] containing:
  /// - id: Solar system ID
  /// - location: 3D coordinates (x, y, z)
  /// - name: Solar system name
  ///
  /// Supports pagination through limit/offset query parameters (max limit: 1000).
  ///
  /// HTTP Status Codes:
  /// - 200: Solar systems with metadata successfully retrieved
  /// - 400: Bad Request
  @GET(path: '/v2/solarsystems')
  Future<Response<PaginationDataEntity<SolarSystemEntity>>> getSolarSystems();

  /// Retrieves detailed information about a specific solar system
  ///
  /// Parameters:
  /// - [id]: Solar System ID (example: "30000001")
  ///
  /// Returns [SolarSystemEntity] with detailed information including:
  /// - id: Solar system identifier
  /// - location: 3D coordinates in space
  /// - name: Solar system name
  /// - regionId: ID of the region containing this system
  /// - smartAssemblies: List of smart assemblies present in this system
  ///
  /// HTTP Status Codes:
  /// - 200: Solar system details successfully retrieved
  /// - 201: When generating a POD (with ?format=pod query parameter)
  /// - 400: Bad Request
  /// - 404: Solar system not found
  /// - 500: Internal Server Error
  @GET(path: '/v2/solarsystems/{id}')
  Future<Response<SolarSystemEntity>> getSolarSystem(@Path() String id);

  /// Retrieves all game types used in the EVE Frontier world
  ///
  /// Returns paginated list of [TypeEntity] containing:
  /// - id: Type identifier
  /// - name: Type name
  /// - description: Type description
  /// - categoryId/categoryName: Category information
  /// - groupId/groupName: Group information
  /// - iconUrl: URL to type icon
  /// - mass: Object mass
  /// - volume: Object volume
  /// - radius: Object radius
  /// - portionSize: Portion size for the type
  ///
  /// Query Parameters:
  /// - [limit]: Maximum number of types to return (optional, max: 1000)
  /// - [offset]: Number of types to skip before collecting results (optional)
  ///
  /// HTTP Status Codes:
  /// - 200: Game types with metadata successfully retrieved
  /// - 400: Bad Request
  @GET(path: '/v2/types')
  Future<Response<PaginationDataEntity<TypeEntity>>> getTypes(
      {@Query() int? limit, @Query() int? offset});

  /// Retrieves detailed information about a specific game type
  ///
  /// Parameters:
  /// - [id]: Game type ID (example: "73192")
  ///
  /// Returns [TypeEntity] with complete type information including:
  /// - All basic properties (name, description, etc.)
  /// - Category and group details
  /// - Physical properties (mass, volume, radius)
  /// - Icon URL for visual representation
  ///
  /// HTTP Status Codes:
  /// - 200: Type details successfully retrieved
  /// - 201: When generating a POD (with ?format=pod query parameter)
  /// - 400: Bad Request
  /// - 404: Type not found
  /// - 500: Internal Server Error
  @GET(path: '/v2/types/{id}')
  Future<Response<TypeEntity>> getType(@Path() String id);
}
