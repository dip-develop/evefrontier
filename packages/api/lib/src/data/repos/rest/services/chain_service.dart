import 'package:chopper/chopper.dart';

import '../../../../../evefrontier_api.dart';

part 'chain_service.chopper.dart';

@ChopperApi()

/// ChainService provides API endpoints for retrieving blockchain-related data from EVE Frontier World API.
///
/// This service handles:
/// - Meta transaction submission for blockchain operations
/// - Kill mail reports and details
/// - Smart assembly information and management
/// - Smart character data and profiles
///
/// Most GET endpoints support pagination through limit/offset parameters.
/// The service interacts with on-chain data and smart contracts.
abstract class ChainService extends ChopperService {
  /// Creates an instance of ChainService with optional ChopperClient
  static ChainService create([ChopperClient? client]) => _$ChainService(client);

  /// Submits a meta transaction to the blockchain
  ///
  /// Meta transactions allow gasless transactions where a relayer pays for gas.
  /// Only specific operations are allowed: bringOnline, bringOffline, and setEntityMetadata.
  ///
  /// Parameters:
  /// - [erc]: [ErcEntity] object containing ERC2771 meta transaction data:
  ///   - data: Transaction data as hex string
  ///   - deadline: Transaction deadline as integer timestamp
  ///   - from: Sender address
  ///   - gas: Gas limit for transaction
  ///   - nonce: Transaction nonce as string
  ///   - signature: Meta transaction signature
  ///   - to: Target contract address
  ///   - value: Transaction value in wei
  ///
  /// HTTP Status Codes:
  /// - 201: Meta transaction successfully submitted
  /// - 400: Bad Request (invalid transaction data)
  /// - 404: Not Found
  /// - 500: Internal Server Error
  @POST(path: '/metatransaction')
  Future<Response> metaTransaction(@Body() ErcEntity erc);

  /// Retrieves all kill mails that have been reported and saved to the blockchain
  ///
  /// Kill mails are reports of player vs player combat events in the game.
  /// This endpoint is paginated for performance.
  ///
  /// Returns paginated list of [KillMailEntity] containing:
  /// - id: Kill mail identifier
  /// - killer: Smart character who performed the kill
  /// - victim: Smart character who was killed
  /// - solarSystemId: ID of solar system where kill occurred
  /// - time: Timestamp of the kill event
  ///
  /// Query Parameters:
  /// - [limit]: Maximum number of kill mails to return (0-100, default varies)
  /// - [offset]: Number of kill mails to skip before collecting results
  ///
  /// HTTP Status Codes:
  /// - 200: Kill mails with metadata successfully retrieved
  /// - 400: Bad Request (invalid pagination parameters)
  /// - 500: Internal Server Error
  @GET(path: '/v2/killmails')
  Future<Response<PaginationDataEntity<KillMailEntity>>> getKillMails(
      {@Query() int? limit, @Query() int? offset});

  /// Retrieves a specific kill mail report by ID
  ///
  /// Parameters:
  /// - [id]: Kill mail ID (example: "1745854210705")
  ///
  /// Returns [KillMailEntity] with detailed kill mail information including:
  /// - Complete killer and victim character details
  /// - Solar system information where kill occurred
  /// - Precise timestamp of the event
  ///
  /// Supports format parameter for POD generation (?format=pod).
  ///
  /// HTTP Status Codes:
  /// - 200: Kill mail details successfully retrieved
  /// - 201: When generating a POD (with ?format=pod query parameter)
  /// - 400: Bad Request
  /// - 404: Kill mail not found
  /// - 500: Internal Server Error
  @GET(path: '/v2/killmails/{id}')
  Future<Response<KillMailEntity>> getKillMail(@Path() String id);

  /// Retrieves all smart assemblies currently deployed in the world
  ///
  /// Smart assemblies are player-deployable structures like gates, storage units,
  /// turrets, and other functional buildings in the EVE Frontier universe.
  ///
  /// Returns paginated list of [SmartAssemblyEntity] containing:
  /// - id: Unique assembly identifier
  /// - name: Assembly name
  /// - energyUsage: Energy consumption of the assembly
  /// - owner: Smart character who owns the assembly
  /// - solarSystem: Solar system where assembly is located
  /// - state: Current state (unknown, unanchored, anchored, online, offline, destroyed)
  /// - type: Assembly type (SmartStorageUnit, SmartTurret, SmartGate, etc.)
  /// - typeDetails: Detailed type information
  /// - typeId: Type identifier
  ///
  /// Query Parameters:
  /// - [limit]: Maximum number of assemblies to return (0-100)
  /// - [offset]: Number of assemblies to skip before collecting results
  ///
  /// HTTP Status Codes:
  /// - 200: Smart assemblies with metadata successfully retrieved
  /// - 400: Bad Request (invalid pagination parameters)
  /// - 500: Internal Server Error
  @GET(path: '/v2/smartassemblies')
  Future<Response<PaginationDataEntity<SmartAssemblyEntity>>>
      getSmartAssemblies({@Query() int? limit, @Query() int? offset});

  /// Retrieves detailed information about a specific smart assembly
  ///
  /// Parameters:
  /// - [id]: Smart Assembly ID (example: "45731444223951840915743646025801713404901938965911491786681215016516925828631")
  ///
  /// Returns [SmartAssemblyEntity] with comprehensive assembly details including:
  /// - Basic information (name, description, energy usage)
  /// - Location and solar system details
  /// - Owner information
  /// - Type-specific data (gate, storage, turret, manufacturing, etc.)
  /// - Current operational state
  /// - dApp URL for interaction
  ///
  /// Type-specific fields are populated based on assembly type:
  /// - Gates: destination info, linking status, range data
  /// - Storage: inventory and capacity information
  /// - Turrets: combat-related data
  /// - Network Nodes: energy distribution info
  ///
  /// Supports format parameter for POD generation (?format=pod).
  ///
  /// HTTP Status Codes:
  /// - 200: Assembly details successfully retrieved
  /// - 201: When generating a POD (with ?format=pod query parameter)
  /// - 400: Bad Request
  /// - 404: Smart assembly not found
  /// - 500: Internal Server Error
  @GET(path: '/v2/smartassemblies/{id}')
  Future<Response<SmartAssemblyEntity>> getSmartAssemblie(@Path() String id);

  /// Retrieves all smart characters currently active in the world
  ///
  /// Smart characters are player avatars in the EVE Frontier universe,
  /// each with unique blockchain addresses and in-game assets.
  ///
  /// Returns paginated list of [SmartCharacterEntity] containing:
  /// - id: Character identifier
  /// - name: Character name
  /// - address: Blockchain address (hex format)
  ///
  /// Query Parameters:
  /// - [limit]: Maximum number of characters to return (0-100)
  /// - [offset]: Number of characters to skip before collecting results
  ///
  /// HTTP Status Codes:
  /// - 200: Smart characters with metadata successfully retrieved
  /// - 400: Bad Request (invalid pagination parameters)
  /// - 500: Internal Server Error
  @GET(path: '/v2/smartcharacters')
  Future<Response<PaginationDataEntity<SmartCharacterEntity>>>
      getSmartCharacters({@Query() int? limit, @Query() int? offset});

  /// Retrieves detailed information about a specific smart character
  ///
  /// Parameters:
  /// - [id]: Character address in hex format (example: "0x7578ca43f52db0d859b3f2081c1464080fe47c00")
  ///
  /// Returns [SmartCharacterEntity] with comprehensive character details including:
  /// - address: Blockchain wallet address
  /// - eveBalanceInWei: EVE token balance in wei units
  /// - gasBalanceInWei: Gas token balance in wei units
  /// - id: Character identifier
  /// - name: Character display name
  /// - portraitUrl: URL to character portrait image
  /// - smartAssemblies: List of assemblies owned by this character
  /// - tribeId: ID of the tribe/corporation the character belongs to
  ///
  /// Supports format parameter for POD generation (?format=pod).
  ///
  /// HTTP Status Codes:
  /// - 200: Character details successfully retrieved
  /// - 201: When generating a POD (with ?format=pod query parameter)
  /// - 404: Character not found
  /// - 422: Unprocessable Entity (invalid address format)
  /// - 500: Internal Server Error
  @GET(path: '/v2/smartcharacters/{id}')
  Future<Response<SmartCharacterEntity>> getSmartCharacter(@Path() String id);
}
