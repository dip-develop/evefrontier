import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:evefrontier_api/evefrontier_api.dart';
import 'package:logging/logging.dart';

/// Example demonstrating all EVE Frontier API operations.
///
/// This example shows how to use every available API endpoint,
/// including proper error handling and pagination usage.
///
/// To run this example:
/// ```bash
/// dart run example/evefrontier_api_example.dart
/// ```
void main() async {
  // Initialize API with detailed logging for debugging
  final api = EVEFrontierAPI(levelLog: Level.ALL);

  print('=== EVE Frontier API Example ===\n');

  // Test all API operations with proper error handling
  await testMetaOperations(api);
  await testChainOperations(api);
  await testGameOperations(api);

  print('\n=== Example completed ===');
}

/// Tests all Meta API operations (configuration, health, POD verification)
Future<void> testMetaOperations(EVEFrontierAPI api) async {
  print('--- Testing Meta API Operations ---\n');

  try {
    // Test API health check
    print('Testing getHealth()...');
    final health = await api.getHealth();
    print('✅ Health: ${health.toString()}\n');

    // Test ABI configuration retrieval
    print('Testing getABISConfig()...');
    final abiConfig = await api.getABISConfig();
    print('✅ ABI Config: ${abiConfig.toString()}\n');

    // Test general configuration retrieval
    print('Testing getConfig()...');
    final config = await api.getConfig();
    print('✅ Config (${config.length} items): ${config.toString()}\n');

    // Test POD verification with sample data
    print('Testing verifyPod()...');
    final podResult = await api.verifyPod(createSamplePod());
    print('✅ POD Verification: ${podResult.toString()}\n');
  } catch (e) {
    print('❌ Meta API Error: $e\n');
  }
}

/// Tests all Chain API operations (blockchain data and transactions)
Future<void> testChainOperations(EVEFrontierAPI api) async {
  print('--- Testing Chain API Operations ---\n');

  try {
    // Test kill mails retrieval with pagination
    print('Testing getKillMails() with pagination...');
    final killMails = await api.getKillMails(limit: 5, offset: 0);
    print(
        '✅ Kill Mails (${killMails.data.length} items): ${killMails.toString()}\n');

    // Test specific kill mail retrieval if any exist
    if (killMails.data.isNotEmpty) {
      print('Testing getKillMail() for first kill mail...');
      final firstKillMail =
          await api.getKillMail(killMails.data.first.id.toString());
      print('✅ Kill Mail Detail: ${firstKillMail.toString()}\n');
    }

    // Test smart assemblies retrieval with pagination
    print('Testing getSmartAssemblies() with pagination...');
    final assemblies = await api.getSmartAssemblies(limit: 5, offset: 0);
    print(
        '✅ Smart Assemblies (${assemblies.data.length} items): ${assemblies.toString()}\n');

    // Test specific smart assembly retrieval if any exist
    if (assemblies.data.isNotEmpty) {
      print('Testing getSmartAssemblie() for first assembly...');
      final firstAssembly =
          await api.getSmartAssemblie(assemblies.data.first.id);
      print('✅ Smart Assembly Detail: ${firstAssembly.toString()}\n');
    }

    // Test smart characters retrieval with pagination
    print('Testing getSmartCharacters() with pagination...');
    final characters = await api.getSmartCharacters(limit: 5, offset: 0);
    print(
        '✅ Smart Characters (${characters.data.length} items): ${characters.toString()}\n');

    // Test specific smart character retrieval if any exist
    if (characters.data.isNotEmpty) {
      print('Testing getSmartCharacter() for first character...');
      final firstCharacter =
          await api.getSmartCharacter(characters.data.first.id);
      print('✅ Smart Character Detail: ${firstCharacter.toString()}\n');
    }

    // Note: Meta transaction testing requires valid transaction data
    print(
        '⚠️  Meta transaction testing skipped (requires valid ERC2771 data)\n');
  } catch (e) {
    print('❌ Chain API Error: $e\n');
  }
}

/// Tests all Game API operations (game data and user activities)
Future<void> testGameOperations(EVEFrontierAPI api) async {
  print('--- Testing Game API Operations ---\n');

  try {
    // Test fuels retrieval
    print('Testing getFuels()...');
    final fuels = await api.getFuels(limit: 10, offset: 0);
    print('✅ Fuels (${fuels.data.length} items): ${fuels.toString()}\n');

    // Test solar systems retrieval
    print('Testing getSolarSystems()...');
    final solarSystems = await api.getSolarSystems();
    print(
        '✅ Solar Systems (${solarSystems.data.length} items): First few: ${solarSystems.data.take(3).toString()}\n');

    // Test specific solar system if any exist
    if (solarSystems.data.isNotEmpty) {
      print('Testing getSolarSystem() for first system...');
      final firstSystem =
          await api.getSolarSystem(solarSystems.data.first.id.toString());
      print('✅ Solar System Detail: ${firstSystem.toString()}\n');
    }

    // Test game types retrieval with pagination
    print('Testing getTypes() with pagination...');
    final types = await api.getTypes();
    print('✅ Types (showing first 3): ${types.data.take(3).toString()}\n');

    // Test specific type if any exist
    if (types.data.isNotEmpty) {
      print('Testing getType() for first type...');
      final firstType = await api.getType(types.data.first.id.toString());
      print('✅ Type Detail: ${firstType.toString()}\n');
    }

    // Note: User-specific operations require authentication
    print(
        '⚠️  User-specific operations (jumps, scans) require authentication:');
    print('   - getJumps() / getJump() - requires Bearer token');
    print('   - getScans() / getScan() - requires Bearer token\n');
  } catch (e) {
    print('❌ Game API Error: $e\n');
  }
}

/// Creates a sample POD entity for testing verification
PodEntity createSamplePod() {
  return PodEntity((builder) => builder
    ..entries = BuiltMap<String, PodValueEntity>.from({
      'sampleData': PodValueEntity((valueBuilder) => valueBuilder
        ..stringVal = 'test_value'
        ..valueType = PodValueTypeEnum.string),
      'numericData': PodValueEntity((valueBuilder) => valueBuilder
        ..bigVal = 42
        ..valueType = PodValueTypeEnum.int),
      'booleanData': PodValueEntity((valueBuilder) => valueBuilder
        ..boolVal = true
        ..valueType = PodValueTypeEnum.boolean),
      'bytesData': PodValueEntity((valueBuilder) => valueBuilder
        ..bytesVal =
            BuiltList<int>.from(Uint8List.fromList([1, 2, 3, 4, 5])).toBuilder()
        ..valueType = PodValueTypeEnum.bytes),
      'timeData': PodValueEntity((valueBuilder) => valueBuilder
        ..timeVal = DateTime.now()
        ..valueType = PodValueTypeEnum.date),
    }).toBuilder()
    ..signature = 'sample_signature_for_testing'
    ..signerPublicKey = 'sample_public_key_for_testing');
}
