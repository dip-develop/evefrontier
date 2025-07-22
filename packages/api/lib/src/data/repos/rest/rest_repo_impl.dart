import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:chopper_built_value/chopper_built_value.dart';

import '../../../../evefrontier_api.dart';
import '../../../domain/interfaces/rest_repo.dart';
import 'services/chain_service.dart';
import 'services/game_service.dart';
import 'services/meta_service.dart';

/// Implementation of the [RestRepo] interface that uses the Chopper library to
/// make HTTP requests to a REST API.
/// This class is responsible for fetching data from the API and returning it
/// in a format that can be used by the application.
/// It uses the [ChopperClient] to create a client that can be used to make
/// requests to the API.
class RestRepoImpl implements RestRepo {
  late final MetaService _meta;
  late final GameService _game;
  late final ChainService _chain;

  RestRepoImpl() {
    final client = ChopperClient(
      baseUrl:
          Uri.tryParse('https://world-api-stillness.live.tech.evefrontier.com'),
      converter: BuiltValueConverter(entititySerializers),
      errorConverter: BuiltValueConverter(entititySerializers),
      services: [
        MetaService.create(),
        ChainService.create(),
        GameService.create(),
      ],
      interceptors: [
        _RestRequestInterceptor(),
        HttpLoggingInterceptor(),
      ],
    );

    _meta = client.getService<MetaService>();
    _game = client.getService<GameService>();
    _chain = client.getService<ChainService>();
  }

  @override

  /// Retrieve the world contracts ABIs with some config
  Future<AbiConfigEntity> getABISConfig() =>
      _meta.getABISConfig().then(_getData);

  @override

  /// Retrieve all the config needed to connect to our services
  Future<BuiltList<ChainConfigEntity>> getConfig() =>
      _meta.getConfig().then(_getData);

  @override

  /// Tells you if the World API is ok
  Future<HealthyEntity> getHealth() => _meta.getHealth().then(_getData);

  @override

  /// Verify a Provable Object Datatype object
  Future<VerifyResponseEntry> verifyPod(PodEntity pod) =>
      _meta.verifyPod(pod).then(_getData);

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
  Future<BuiltMap<String, SolarSystemEntity>> getSolarSystems() =>
      _game.getSolarSystems().then(_getData).then((value) {
        final solarSystems = Map<String, SolarSystemEntity>.identity();
        for (var entry in value.entries) {
          final solarSystem = entititySerializers.deserializeWith(
              SolarSystemEntity.serializer, entry.value);
          if (solarSystem != null) {
            solarSystems[entry.key] = solarSystem;
          }
        }
        return BuiltMap.from(solarSystems);
      });

  @override
  Future<StaticDataEntity> getType(String id) =>
      _game.getType(id).then(_getData);

  @override
  Future<AllTypesDataEntity> getTypes() => _game.getTypes().then(_getData);

  @override
  Future<void> metaTransaction(ErcEntity erc) =>
      _chain.metaTransaction(erc).then(_getData);

  FutureOr<T> _getData<T>(Response<T> response) {
    if (response.isSuccessful) {
      return response.body!;
    }
    return Future<T>.error(Exception(response.error));
  }
}

class _RestRequestInterceptor implements Interceptor {
  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
      Chain<BodyType> chain) async {
    final request = applyHeaders(chain.request, {'accept': 'application/json'});

    return chain.proceed(request);
  }
}
