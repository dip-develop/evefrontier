// dart format width=80
//Generated code

part of 'chain_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$ChainService extends ChainService {
  _$ChainService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = ChainService;

  @override
  Future<Response<dynamic>> metaTransaction(ErcEntity erc) {
    final Uri $url = Uri.parse('/metatransaction');
    final $body = erc;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<PaginationDataEntity<KillMailEntity>>> getKillMails({
    int? limit,
    int? offset,
  }) {
    final Uri $url = Uri.parse('/v2/killmails');
    final Map<String, dynamic> $params = <String, dynamic>{
      'limit': limit,
      'offset': offset,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client
        .send<PaginationDataEntity<KillMailEntity>, KillMailEntity>($request);
  }

  @override
  Future<Response<KillMailEntity>> getKillMail(String id) {
    final Uri $url = Uri.parse('/v2/killmails/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<KillMailEntity, KillMailEntity>($request);
  }

  @override
  Future<Response<PaginationDataEntity<SmartAssemblyEntity>>>
      getSmartAssemblies({
    int? limit,
    int? offset,
  }) {
    final Uri $url = Uri.parse('/v2/smartassemblies');
    final Map<String, dynamic> $params = <String, dynamic>{
      'limit': limit,
      'offset': offset,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<PaginationDataEntity<SmartAssemblyEntity>,
        SmartAssemblyEntity>($request);
  }

  @override
  Future<Response<SmartAssemblyEntity>> getSmartAssemblie(String id) {
    final Uri $url = Uri.parse('/v2/smartassemblies/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<SmartAssemblyEntity, SmartAssemblyEntity>($request);
  }

  @override
  Future<Response<PaginationDataEntity<SmartCharacterEntity>>>
      getSmartCharacters({
    int? limit,
    int? offset,
  }) {
    final Uri $url = Uri.parse('/v2/smartcharacters');
    final Map<String, dynamic> $params = <String, dynamic>{
      'limit': limit,
      'offset': offset,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<PaginationDataEntity<SmartCharacterEntity>,
        SmartCharacterEntity>($request);
  }

  @override
  Future<Response<SmartCharacterEntity>> getSmartCharacter(String id) {
    final Uri $url = Uri.parse('/v2/smartcharacters/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<SmartCharacterEntity, SmartCharacterEntity>($request);
  }
}
