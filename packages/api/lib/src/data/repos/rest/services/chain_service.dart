import 'package:chopper/chopper.dart';

import '../../../../../evefrontier_api.dart';

part 'chain_service.chopper.dart';

@ChopperApi()

/// This service is used to retrieve the chain data from the API.
/// It provides endpoints to get information about the kill mails, smart assemblies and smart characters in the game.
/// It also provides an endpoint to submit a meta transaction.
abstract class ChainService extends ChopperService {
  static ChainService create([ChopperClient? client]) => _$ChainService(client);

  // Submit a meta transaction
  // Only bringOnline, bringOffline and setEntityMetadata are allowed
  @POST(path: '/metatransaction')
  Future<Response> metaTransaction(@Body() ErcEntity erc);

  // Get a list all the kill mails reported by players
  @GET(path: '/v2/killmails')
  Future<Response<PaginationDataEntity<KillMailEntity>>> getKillMails(
      {@Query() int? limit, @Query() int? offset});

  // Get a kill mail report
  @GET(path: '/v2/killmails/{id}')
  Future<Response<KillMailEntity>> getKillMail(@Path() String id);

  // Get a list all the smart assemblies currently in the world
  @GET(path: '/v2/smartassemblies')
  Future<Response<PaginationDataEntity<SmartAssemblyEntity>>>
      getSmartAssemblies({@Query() int? limit, @Query() int? offset});

  // Retrieve one smart assembly with the given with the given [id]
  @GET(path: '/v2/smartassemblies/{id}')
  Future<Response<SmartAssemblyEntity>> getSmartAssemblie(@Path() String id);

  // Get a list all the smart characters currently in the world
  @GET(path: '/v2/smartcharacters')
  Future<Response<PaginationDataEntity<SmartCharacterEntity>>>
      getSmartCharacters({@Query() int? limit, @Query() int? offset});

  // Retrieve one smart character with the given with the given [id]
  @GET(path: '/v2/smartcharacters/{id}')
  Future<Response<SmartCharacterEntity>> getSmartCharacter(@Path() String id);
}
