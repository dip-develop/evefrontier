library;

import 'package:built_collection/built_collection.dart';
import 'package:evefrontier_api/src/data/repos/rest/rest_repo_impl.dart';
import 'package:logging/logging.dart';

import 'src/data/entities/entities.dart';
import 'src/domain/interfaces/rest_repo.dart';

export 'src/data/entities/entities.dart';

/// EVEFrontierAPI is the main entry point for interacting with the EVE Frontier World API.
///
/// This class provides a simplified, high-level interface that abstracts the complexity
/// of the underlying REST API implementation. It serves as a facade that delegates
/// all operations to the appropriate repository implementation while providing
/// additional features like configurable logging.
///
/// Key features:
/// - Unified API surface for all EVE Frontier operations
/// - Configurable logging system for debugging and monitoring
/// - Clean separation between public interface and internal implementation
/// - Type-safe method signatures with domain entities
/// - Organized method grouping by functional area (Chain, Game, Meta)
///
/// Usage example:
/// ```dart
/// final api = EVEFrontierAPI(levelLog: Level.INFO);
/// final health = await api.getHealth();
/// final killMails = await api.getKillMails(limit: 10);
/// ```
///
/// The class automatically handles:
/// - HTTP client configuration and lifecycle
/// - Request/response serialization
/// - Error handling and propagation
/// - Logging configuration and output formatting
class EVEFrontierAPI {
  /// Internal repository instance that handles all REST API operations
  late final RestRepo _api;

  /// Initializes the EVE Frontier API client with optional logging configuration.
  ///
  /// Sets up the complete API infrastructure including:
  /// - REST repository implementation with HTTP client
  /// - Logging system with configurable verbosity
  /// - Request/response processing pipeline
  ///
  /// Parameters:
  /// - [levelLog]: Optional logging level for debugging and monitoring.
  ///   Defaults to [Level.OFF] (no logging) for production use.
  ///   Use [Level.INFO] for general logging or [Level.ALL] for detailed debugging.
  ///
  /// The logging system outputs formatted messages including:
  /// - Log level (INFO, WARNING, SEVERE, etc.)
  /// - Timestamp of the log entry
  /// - Detailed message content
  ///
  /// Example:
  /// ```dart
  /// // Production (no logging)
  /// final api = EVEFrontierAPI();
  ///
  /// // Development with logging
  /// final api = EVEFrontierAPI(levelLog: Level.INFO);
  /// ```
  EVEFrontierAPI({Level? levelLog}) {
    // Initialize the REST repository implementation
    _api = RestRepoImpl();

    // Configure logging system
    Logger.root.level = levelLog ?? Level.OFF;
    Logger.root.onRecord.listen((record) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    });
  }

  //
  // Chain REST API Operations
  //
  // Methods for interacting with blockchain data and smart contracts.
  // These operations handle player-generated content and on-chain assets.
  //

  /// Submits a meta transaction to the blockchain
  ///
  /// Meta transactions enable gasless operations where a relayer pays gas fees.
  /// Only specific operations are permitted: bringOnline, bringOffline, and setEntityMetadata.
  ///
  /// Parameters:
  /// - [erc]: ERC2771 meta transaction data including signature and transaction details
  ///
  /// Throws exceptions on invalid transaction data or blockchain errors.
  Future<void> metaTransaction(ErcEntity erc) => _api.metaTransaction(erc);

  /// Retrieves all kill mails reported by players
  ///
  /// Kill mails document player vs player combat events stored on the blockchain.
  /// Results are paginated for performance optimization.
  ///
  /// Parameters:
  /// - [limit]: Maximum number of kill mails to return (optional, 0-100)
  /// - [offset]: Number of kill mails to skip for pagination (optional)
  ///
  /// Returns paginated collection of kill mail entities with metadata.
  Future<PaginationDataEntity<KillMailEntity>> getKillMails(
          {int? limit, int? offset}) =>
      _api.getKillMails(limit: limit, offset: offset);

  /// Retrieves a specific kill mail report by ID
  ///
  /// Parameters:
  /// - [id]: Unique kill mail identifier
  ///
  /// Returns detailed kill mail information including killer, victim, location, and timestamp.
  /// Throws exception if kill mail is not found.
  Future<KillMailEntity> getKillMail(String id) => _api.getKillMail(id);

  /// Retrieves all smart assemblies currently deployed in the world
  ///
  /// Smart assemblies are player-deployable structures including gates, storage units,
  /// turrets, and other functional buildings in the EVE Frontier universe.
  ///
  /// Parameters:
  /// - [limit]: Maximum number of assemblies to return (optional, 0-100)
  /// - [offset]: Number of assemblies to skip for pagination (optional)
  ///
  /// Returns paginated collection of smart assembly entities with operational data.
  Future<PaginationDataEntity<SmartAssemblyEntity>> getSmartAssemblies(
          {int? limit, int? offset}) =>
      _api.getSmartAssemblies(limit: limit, offset: offset);

  /// Retrieves detailed information about a specific smart assembly
  ///
  /// Parameters:
  /// - [id]: Unique smart assembly identifier (large integer as string)
  ///
  /// Returns comprehensive assembly details including type-specific data,
  /// ownership, location, and operational status.
  /// Throws exception if assembly is not found.
  Future<SmartAssemblyEntity> getSmartAssemblie(String id) =>
      _api.getSmartAssemblie(id);

  /// Retrieves all smart characters currently active in the world
  ///
  /// Smart characters represent player avatars with blockchain addresses
  /// and associated in-game assets.
  ///
  /// Parameters:
  /// - [limit]: Maximum number of characters to return (optional, 0-100)
  /// - [offset]: Number of characters to skip for pagination (optional)
  ///
  /// Returns paginated collection of smart character entities.
  Future<PaginationDataEntity<SmartCharacterEntity>> getSmartCharacters(
          {int? limit, int? offset}) =>
      _api.getSmartCharacters(limit: limit, offset: offset);

  /// Retrieves detailed information about a specific smart character
  ///
  /// Parameters:
  /// - [id]: Character blockchain address in hex format (e.g., "0x7578ca43...")
  ///
  /// Returns comprehensive character details including balances, assets,
  /// and tribe membership information.
  /// Throws exception if character is not found or address is invalid.
  Future<SmartCharacterEntity> getSmartCharacter(String id) =>
      _api.getSmartCharacter(id);

  //
  // Game REST API Operations
  //
  // Methods for accessing game-specific data including fuel information,
  // player activities, and world configuration.
  //

  /// Retrieves all available fuels for smart assemblies
  ///
  /// Fuels power various smart assemblies and have different efficiency ratings.
  ///
  /// Parameters:
  /// - [limit]: Maximum number of fuels to return (optional)
  /// - [offset]: Number of fuels to skip for pagination (optional)
  ///
  /// Returns paginated collection of fuel entities with efficiency data.
  Future<PaginationDataEntity<FuelEntity>> getFuels(
          {int? limit, int? offset}) =>
      _api.getFuels(limit: limit, offset: offset);

  /// Retrieves jump history for the authenticated user's smart character
  ///
  /// **Requires Authentication**: User must be authenticated to access personal jump data.
  ///
  /// Parameters:
  /// - [limit]: Maximum number of jumps to return (optional)
  /// - [offset]: Number of jumps to skip for pagination (optional)
  ///
  /// Returns paginated collection of jump entities with destination and timing data.
  Future<PaginationDataEntity<JumpEntity>> getJumps(
          {int? limit, int? offset}) =>
      _api.getJumps(limit: limit, offset: offset);

  /// Retrieves a specific jump by ID for the authenticated user
  ///
  /// **Requires Authentication**: User must be authenticated to access personal jump data.
  ///
  /// Parameters:
  /// - [id]: Jump identifier (typically UNIX timestamp)
  ///
  /// Returns detailed jump information including ship, route, and timing data.
  /// Throws exception if jump is not found or user lacks access.
  Future<JumpEntity> getJump(String id) => _api.getJump(id);

  /// Retrieves scan history for the authenticated user's smart character
  ///
  /// **Requires Authentication**: User must be authenticated to access personal scan data.
  /// **Note**: Currently returns mocked data for development purposes.
  ///
  /// Parameters:
  /// - [limit]: Maximum number of scans to return (optional)
  /// - [offset]: Number of scans to skip for pagination (optional)
  ///
  /// Returns paginated collection of scan entities with object and location data.
  Future<PaginationDataEntity<ScanEntity>> getScans(
          {int? limit, int? offset}) =>
      _api.getScans(limit: limit, offset: offset);

  /// Retrieves a specific scan by ID for the authenticated user
  ///
  /// **Requires Authentication**: User must be authenticated to access personal scan data.
  /// **Note**: Currently returns mocked data for development purposes.
  ///
  /// Parameters:
  /// - [id]: Scan identifier
  ///
  /// Returns detailed scan information including scanned object properties.
  /// Throws exception if scan is not found or user lacks access.
  Future<ScanEntity> getScan(String id) => _api.getScan(id);

  /// Retrieves all solar systems currently available in the game
  ///
  /// Solar systems represent locations in the EVE Frontier universe where
  /// players can deploy assemblies and conduct activities.
  ///
  /// Returns paginated collection of solar system entities with location data.
  /// Supports up to 1000 systems per request.
  Future<PaginationDataEntity<SolarSystemEntity>> getSolarSystems() =>
      _api.getSolarSystems();

  /// Retrieves detailed information about a specific solar system
  ///
  /// Parameters:
  /// - [id]: Solar System ID (example: "30000001")
  ///
  /// Returns comprehensive solar system information including location,
  /// region details, and associated smart assemblies.
  /// Throws exception if solar system is not found.
  Future<SolarSystemEntity> getSolarSystem(String id) =>
      _api.getSolarSystem(id);

  /// Retrieves all game types used in the EVE Frontier world
  ///
  /// Types define the properties and behaviors of various game objects
  /// including ships, items, assemblies, and other entities.
  ///
  /// Returns paginated collection of type entities with detailed properties.
  /// Supports up to 1000 types per request.
  Future<PaginationDataEntity<TypeEntity>> getTypes() => _api.getTypes();

  /// Retrieves detailed information about a specific game type
  ///
  /// Parameters:
  /// - [id]: Game type identifier
  ///
  /// Returns comprehensive type information including physical properties,
  /// category classification, and visual assets.
  /// Throws exception if type is not found.
  Future<TypeEntity> getType(String id) => _api.getType(id);

  //
  // Meta REST API Operations
  //
  // Methods for API configuration, health monitoring, and cryptographic
  // verification services.
  //

  /// Retrieves world contracts ABIs along with configuration data
  ///
  /// ABIs (Application Binary Interfaces) define how to interact with
  /// smart contracts deployed in the EVE Frontier world.
  ///
  /// Returns configuration entity containing contract ABIs, exchange rates,
  /// system IDs, and dApp URLs required for blockchain integration.
  Future<AbiConfigEntity> getABISConfig() => _api.getABISConfig();

  /// Retrieves comprehensive configuration for connecting to EVE Frontier services
  ///
  /// Provides all necessary connection details including RPC endpoints,
  /// contract addresses, API URLs, and cryptographic keys.
  ///
  /// Returns list of chain configuration entities for different networks
  /// and environments, enabling multi-chain support.
  Future<BuiltList<ChainConfigEntity>> getConfig() => _api.getConfig();

  /// Performs health check on the World API
  ///
  /// Used for monitoring and service availability verification.
  /// Should be called periodically to ensure API responsiveness.
  ///
  /// Returns health status entity indicating API operational state.
  /// Throws exception if API is not responding properly.
  Future<HealthyEntity> getHealth() => _api.getHealth();

  /// Verifies a POD (Provable Object Datatype) object
  ///
  /// PODs are cryptographically signed data structures that enable
  /// verifiable off-chain data with on-chain verification capabilities.
  ///
  /// Parameters:
  /// - [pod]: POD entity containing data entries, signature, and public key
  ///
  /// Returns verification response indicating validity and any error details.
  /// Used for ensuring data integrity in decentralized applications.
  Future<VerifyResponseEntry> verifyPod(PodEntity pod) => _api.verifyPod(pod);
}
