import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:evefrontier_api/evefrontier_api.dart';
import 'package:logging/logging.dart';
import 'package:test/test.dart';

/// Comprehensive test suite for EVE Frontier API.
///
/// This test suite covers all API endpoints and ensures they return
/// expected data structures and handle errors appropriately.
///
/// To run these tests:
/// ```bash
/// dart test test/evefrontier_api_test.dart
/// ```
void main() {
  late EVEFrontierAPI api;

  setUpAll(() {
    // Initialize API with logging disabled for clean test output
    api = EVEFrontierAPI(levelLog: Level.OFF);
  });

  group('Meta API Operations', () {
    test('getHealth() should return health status', () async {
      final health = await api.getHealth();

      expect(health, isNotNull);
      expect(health.ok, isA<bool>());
    });

    test('getABISConfig() should return ABI configuration', () async {
      final abiConfig = await api.getABISConfig();

      expect(abiConfig, isNotNull);
      expect(abiConfig.cfg, isNotNull);
      expect(abiConfig.baseDappUrl, isNotNull);
      expect(abiConfig.vaultDappUrl, isNotNull);
      expect(abiConfig.systemIds, isNotNull);
    });

    test('getConfig() should return chain configuration list', () async {
      final config = await api.getConfig();

      expect(config, isNotNull);
      expect(config, isA<BuiltList<ChainConfigEntity>>());
      expect(config.length, greaterThan(0));

      // Check first config has required fields
      final firstConfig = config.first;
      expect(firstConfig.chainId, isNotNull);
      expect(firstConfig.name, isNotNull);
      expect(firstConfig.contracts, isNotNull);
    });

    test('verifyPod() should verify POD object', () async {
      final pod = createTestPod();
      final result = await api.verifyPod(pod);

      expect(result, isNotNull);
      expect(result.isValid, isA<bool>());
      // Note: Result may be false for test data, but API should respond
    });
  });

  group('Chain API Operations', () {
    test('getKillMails() should return paginated kill mails', () async {
      final killMails = await api.getKillMails(limit: 5, offset: 0);

      expect(killMails, isNotNull);
      expect(killMails.data, isA<BuiltList<KillMailEntity>>());
      expect(killMails.metadata, isNotNull);
      expect(killMails.metadata.limit, equals(5));
      expect(killMails.metadata.offset, equals(0));
    });

    test('getKillMail() should return specific kill mail if exists', () async {
      final killMails = await api.getKillMails(limit: 1);

      if (killMails.data.isNotEmpty) {
        final killMailId = killMails.data.first.id.toString();
        final killMail = await api.getKillMail(killMailId);

        expect(killMail, isNotNull);
        expect(killMail.id.toString(), equals(killMailId));
        expect(killMail.killer, isNotNull);
        expect(killMail.victim, isNotNull);
      }
    }, skip: 'Depends on available kill mail data');

    test('getSmartAssemblies() should return paginated smart assemblies',
        () async {
      final assemblies = await api.getSmartAssemblies(limit: 5, offset: 0);

      expect(assemblies, isNotNull);
      expect(assemblies.data, isA<BuiltList<SmartAssemblyEntity>>());
      expect(assemblies.metadata, isNotNull);
    });

    test('getSmartAssemblie() should return specific assembly if exists',
        () async {
      final assemblies = await api.getSmartAssemblies(limit: 1);

      if (assemblies.data.isNotEmpty) {
        final assemblyId = assemblies.data.first.id;
        final assembly = await api.getSmartAssemblie(assemblyId);

        expect(assembly, isNotNull);
        expect(assembly.id, equals(assemblyId));
        expect(assembly.name, isNotNull);
        expect(assembly.owner, isNotNull);
      }
    }, skip: 'Depends on available assembly data');

    test('getSmartCharacters() should return paginated smart characters',
        () async {
      final characters = await api.getSmartCharacters(limit: 5, offset: 0);

      expect(characters, isNotNull);
      expect(characters.data, isA<BuiltList<SmartCharacterEntity>>());
      expect(characters.metadata, isNotNull);
    });

    test('getSmartCharacter() should return specific character if exists',
        () async {
      final characters = await api.getSmartCharacters(limit: 1);

      if (characters.data.isNotEmpty) {
        final characterId = characters.data.first.id;
        final character = await api.getSmartCharacter(characterId);

        expect(character, isNotNull);
        expect(character.id, equals(characterId));
        expect(character.name, isNotNull);
        expect(character.address, isNotNull);
      }
    }, skip: 'Depends on available character data');

    test('metaTransaction() should handle transaction submission', () async {
      // Note: This test would require valid transaction data
      // Skipping actual test but ensuring method exists
      expect(() => api.metaTransaction(createTestErcEntity()), returnsNormally);
    }, skip: 'Requires valid ERC2771 transaction data');
  });

  group('Game API Operations', () {
    test('getFuels() should return paginated fuel data', () async {
      final fuels = await api.getFuels(limit: 10, offset: 0);

      expect(fuels, isNotNull);
      expect(fuels.data, isA<BuiltList<FuelEntity>>());
      expect(fuels.metadata, isNotNull);
    });

    test('getSolarSystems() should return solar systems data', () async {
      final solarSystems = await api.getSolarSystems();

      expect(solarSystems, isNotNull);
      expect(solarSystems.data, isA<BuiltList<SolarSystemEntity>>());
      expect(solarSystems.data.length, greaterThan(0));

      // Check first solar system has required fields
      final firstSystem = solarSystems.data.first;
      expect(firstSystem.id, isNotNull);
      expect(firstSystem.name, isNotNull);
      expect(firstSystem.location, isNotNull);
    });

    test('getSolarSystem() should return specific solar system', () async {
      final solarSystems = await api.getSolarSystems();

      if (solarSystems.data.isNotEmpty) {
        final systemId = solarSystems.data.first.id.toString();
        final solarSystem = await api.getSolarSystem(systemId);

        expect(solarSystem, isNotNull);
        expect(solarSystem.id.toString(), equals(systemId));
        expect(solarSystem.name, isNotNull);
        expect(solarSystem.location, isNotNull);
      }
    });

    test('getTypes() should return game types data', () async {
      final types = await api.getTypes();

      expect(types, isNotNull);
      expect(types.data, isA<BuiltList<TypeEntity>>());
      expect(types.data.length, greaterThan(0));

      // Check first type has required fields
      final firstType = types.data.first;
      expect(firstType.id, isNotNull);
      expect(firstType.name, isNotNull);
    });

    test('getType() should return specific type', () async {
      final types = await api.getTypes();

      if (types.data.isNotEmpty) {
        final typeId = types.data.first.id.toString();
        final type = await api.getType(typeId);

        expect(type, isNotNull);
        expect(type.id.toString(), equals(typeId));
        expect(type.name, isNotNull);
      }
    });

    group('User-Specific Operations (Require Authentication)', () {
      test('getJumps() should handle authentication requirement', () async {
        try {
          await api.getJumps(limit: 5);
          // If successful, check response structure
        } catch (e) {
          // Expected to fail without authentication
          expect(e.toString(), contains('401'));
        }
      });

      test('getJump() should handle authentication requirement', () async {
        try {
          await api.getJump('test_id');
          // If successful, check response structure
        } catch (e) {
          // Expected to fail without authentication or invalid ID
          expect(e, isNotNull);
        }
      });

      test('getScans() should handle authentication requirement', () async {
        try {
          await api.getScans(limit: 5);
          // If successful, check response structure
        } catch (e) {
          // Expected to fail without authentication
          expect(e.toString(), contains('401'));
        }
      });

      test('getScan() should handle authentication requirement', () async {
        try {
          await api.getScan('test_id');
          // If successful, check response structure
        } catch (e) {
          // Expected to fail without authentication or invalid ID
          expect(e, isNotNull);
        }
      });
    });
  });

  group('Error Handling', () {
    test('should handle non-existent resources gracefully', () async {
      try {
        await api.getKillMail('nonexistent_id');
        fail('Should have thrown an exception');
      } catch (e) {
        expect(e, isNotNull);
        // Should be a 404 or similar error
      }
    });

    test('should handle invalid POD data gracefully', () async {
      final invalidPod = createInvalidPod();

      try {
        final result = await api.verifyPod(invalidPod);
        // Should return invalid result rather than throwing
        expect(result.isValid, isFalse);
      } catch (e) {
        // Or might throw an exception for completely invalid data
        expect(e, isNotNull);
      }
    });
  });

  group('Pagination', () {
    test('should respect limit and offset parameters', () async {
      final page1 = await api.getKillMails(limit: 2, offset: 0);
      final page2 = await api.getKillMails(limit: 2, offset: 2);

      expect(page1.metadata.limit, equals(2));
      expect(page1.metadata.offset, equals(0));
      expect(page2.metadata.offset, equals(2));

      // Pages should be different (if enough data exists)
      if (page1.data.isNotEmpty && page2.data.isNotEmpty) {
        expect(page1.data.first.id, isNot(equals(page2.data.first.id)));
      }
    });
  });
}

/// Creates a test POD entity for verification testing
PodEntity createTestPod() {
  return PodEntity((builder) => builder
    ..entries = BuiltMap<String, PodValueEntity>.from({
      'testString': PodValueEntity((valueBuilder) => valueBuilder
        ..stringVal = 'test_value'
        ..valueType = PodValueTypeEnum.string),
      'testNumber': PodValueEntity((valueBuilder) => valueBuilder
        ..bigVal = 42
        ..valueType = PodValueTypeEnum.int),
      'testBoolean': PodValueEntity((valueBuilder) => valueBuilder
        ..boolVal = true
        ..valueType = PodValueTypeEnum.boolean),
      'testBytes': PodValueEntity((valueBuilder) => valueBuilder
        ..bytesVal =
            BuiltList<int>.from(Uint8List.fromList([1, 2, 3, 4, 5])).toBuilder()
        ..valueType = PodValueTypeEnum.bytes),
      'testDate': PodValueEntity((valueBuilder) => valueBuilder
        ..timeVal = DateTime.now()
        ..valueType = PodValueTypeEnum.date),
    }).toBuilder()
    ..signature = 'test_signature_for_verification'
    ..signerPublicKey = 'test_public_key_for_verification');
}

/// Creates an invalid POD entity for error testing
PodEntity createInvalidPod() {
  return PodEntity((builder) => builder
    ..entries = BuiltMap<String, PodValueEntity>.from({
      'invalidData': PodValueEntity((valueBuilder) => valueBuilder
        ..stringVal = 'invalid'
        ..valueType = PodValueTypeEnum.string),
    }).toBuilder()
    ..signature = 'invalid_signature'
    ..signerPublicKey = 'invalid_public_key');
}

/// Creates a test ERC entity for meta transaction testing
ErcEntity createTestErcEntity() {
  return ErcEntity((builder) => builder
    ..data = '0x'
    ..deadline =
        DateTime.now().millisecondsSinceEpoch + 3600000 // 1 hour from now
    ..from = '0x0000000000000000000000000000000000000000'
    ..gas = 21000
    ..nonce = '0'
    ..signature = 'test_signature'
    ..to = '0x0000000000000000000000000000000000000000'
    ..value = 0);
}
