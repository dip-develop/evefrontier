// dart format width=80
//Generated code

part of 'game_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$GameService extends GameService {
  _$GameService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = GameService;

  @override
  Future<Response<PaginationDataEntity<FuelEntity>>> getFuels({
    int? limit,
    int? offset,
  }) {
    final Uri $url = Uri.parse('/v2/fuels');
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
    return client.send<PaginationDataEntity<FuelEntity>, FuelEntity>($request);
  }

  @override
  Future<Response<PaginationDataEntity<JumpEntity>>> getMeJumps({
    int? limit,
    int? offset,
  }) {
    final Uri $url = Uri.parse('/v2/smartcharacters/me/jumps');
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
    return client.send<PaginationDataEntity<JumpEntity>, JumpEntity>($request);
  }

  @override
  Future<Response<JumpEntity>> getMeJump(String id) {
    final Uri $url = Uri.parse('/v2/smartcharacters/me/jumps/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<JumpEntity, JumpEntity>($request);
  }

  @override
  Future<Response<PaginationDataEntity<ScanEntity>>> getMeScans({
    int? limit,
    int? offset,
  }) {
    final Uri $url = Uri.parse('/v2/smartcharacters/me/scans');
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
    return client.send<PaginationDataEntity<ScanEntity>, ScanEntity>($request);
  }

  @override
  Future<Response<ScanEntity>> getMeScan(String id) {
    final Uri $url = Uri.parse('/v2/smartcharacters/me/scans/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ScanEntity, ScanEntity>($request);
  }

  @override
  Future<Response<PaginationDataEntity<SolarSystemEntity>>> getSolarSystems({
    int? limit,
    int? offset,
  }) {
    final Uri $url = Uri.parse('/v2/solarsystems');
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
    return client.send<PaginationDataEntity<SolarSystemEntity>,
        SolarSystemEntity>($request);
  }

  @override
  Future<Response<SolarSystemEntity>> getSolarSystem(String id) {
    final Uri $url = Uri.parse('/v2/solarsystems/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<SolarSystemEntity, SolarSystemEntity>($request);
  }

  @override
  Future<Response<PaginationDataEntity<TypeEntity>>> getTypes({
    int? limit,
    int? offset,
  }) {
    final Uri $url = Uri.parse('/v2/types');
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
    return client.send<PaginationDataEntity<TypeEntity>, TypeEntity>($request);
  }

  @override
  Future<Response<TypeEntity>> getType(String id) {
    final Uri $url = Uri.parse('/v2/types/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<TypeEntity, TypeEntity>($request);
  }
}
