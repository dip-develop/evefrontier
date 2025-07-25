import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';

import '../../../entities/entities.dart';

part 'meta_service.chopper.dart';

@ChopperApi()

/// MetaService provides API for retrieving metadata and configuration for EVE Frontier World API.
///
/// This service is used for:
/// - Retrieving world contracts ABIs (Application Binary Interface) and their configuration
/// - Retrieving all necessary configurations for connecting to our services
/// - Checking World API status through health check endpoint
/// - Verifying POD (Provable Object Datatype) objects
///
/// All methods return Response wrapper with corresponding entity objects.
abstract class MetaService extends ChopperService {
  /// Creates an instance of MetaService with optional ChopperClient
  static MetaService create([ChopperClient? client]) => _$MetaService(client);

  /// Retrieves the world contracts ABIs along with configuration
  ///
  /// Returns [AbiConfigEntity] which contains:
  /// - Array of ABI configurations for various contracts
  /// - EVE to LUX exchange rate
  /// - Base dApp URL
  /// - Exchange wallet address
  /// - System function IDs
  /// - List of available solar systems
  /// - Vault dApp URL
  ///
  /// HTTP Status Codes:
  /// - 200: Configuration successfully retrieved
  /// - 400: Bad Request
  /// - 404: Not Found
  /// - 500: Internal Server Error
  @GET(path: '/abis/config')
  Future<Response<AbiConfigEntity>> getABISConfig();

  /// Retrieves all configuration needed to connect to our services
  ///
  /// Returns a list of [ChainConfigEntity] with the following data:
  /// - EVE to LUX exchange rate
  /// - Base dApp and vault dApp URLs
  /// - Blockchain explorer URL
  /// - Chain ID
  /// - Contract configurations (addresses, versions)
  /// - Exchange wallet address
  /// - Indexer and IPFS API URLs
  /// - Item type IDs
  /// - Metadata API URL
  /// - Native currency information
  /// - Public key for POD signing
  /// - RPC server URLs (public and private)
  /// - System function IDs
  ///
  /// HTTP Status Codes:
  /// - 200: Configuration successfully retrieved
  /// - 400: Bad Request
  /// - 404: Not Found
  /// - 500: Internal Server Error
  @GET(path: '/config')
  Future<Response<BuiltList<ChainConfigEntity>>> getConfig();

  /// Checks World API status (health check)
  ///
  /// Returns [HealthyEntity] with information about whether the API is working correctly.
  /// Used for monitoring and checking service availability.
  ///
  /// HTTP Status Codes:
  /// - 200: API is working correctly
  /// - 400: Bad Request
  /// - 404: Not Found
  /// - 500: Internal Server Error
  @GET(path: '/health')
  Future<Response<HealthyEntity>> getHealth();

  /// Verifies a POD (Provable Object Datatype) object
  ///
  /// POD is a cryptographically signed object that contains
  /// verifiable data. This method checks the validity of POD object
  /// and its signature.
  ///
  /// Parameters:
  /// - [pod]: [PodEntity] object for verification, containing:
  ///   - entries: Dictionary of POD data
  ///   - signature: Cryptographic signature
  ///   - signerPublicKey: Public key of the signer
  ///
  /// Returns [VerifyResponseEntry] with verification result:
  /// - isValid: Boolean value indicating POD validity
  /// - error: Error description if verification failed
  ///
  /// HTTP Status Codes:
  /// - 200: Verification successfully completed
  /// - 400: Bad Request or invalid POD
  @POST(path: '/v2/pod/verify')
  Future<Response<VerifyResponseEntry>> verifyPod(PodEntity pod);
}
