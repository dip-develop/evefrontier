import 'package:built_collection/built_collection.dart';

import '../../data/entities/entities.dart';

abstract interface class RestRepo {
  // Chain REST
  //
  // Submit a meta transaction
  // Only bringOnline, bringOffline and setEntityMetadata are allowed
  Future<void> metaTransaction(ErcEntity erc);
  // Get a list all the kill mails reported by players
  Future<PaginationDataEntity<KillMailEntity>> getKillMails(
      {int? limit, int? offset});
  // Get a the kill mail report
  Future<KillMailEntity> getKillMail(String id);
  // Get a list all the smart assemblies currently in the world
  Future<PaginationDataEntity<SmartAssemblyEntity>> getSmartAssemblies(
      {int? limit, int? offset});
  // Retrieve one smart assembly with the given [id]
  Future<SmartAssemblyEntity> getSmartAssemblie(String id);
  // Get a list all the smart characters currently in the world
  Future<PaginationDataEntity<SmartCharacterEntity>> getSmartCharacters(
      {int? limit, int? offset});
  // Retrieve one smart character with the given [id]
  Future<SmartCharacterEntity> getSmartCharacter(String id);
  // Game REST
  //
  // Get a list all the solar systems currently in the application
  Future<BuiltMap<String, SolarSystemEntity>> getSolarSystems();
  // Get a list all the types used in the world
  Future<AllTypesDataEntity> getTypes();
  // Get info about a single game type with the given [id]
  Future<StaticDataEntity> getType(String id);
  // Meta REST
  //
  // Retrieve the world contracts ABIs with some config
  Future<AbiConfigEntity> getABISConfig();
  // Retrieve all the config needed to connect to our services
  Future<BuiltList<ChainConfigEntity>> getConfig();
  // Tells you if the World API is ok
  Future<HealthyEntity> getHealth();
  // Verify a Provable Object Datatype object
  Future<VerifyResponseEntry> verifyPod(PodEntity pod);
}
