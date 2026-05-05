import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/iso_8601_duration_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'auth_result.dart';
import 'ethereum_address.dart';

export 'auth_result.dart';
export 'hex_key_provider.dart';
export 'mnemonic_key_provider.dart';
export 'ethereum_address.dart';

part 'models.g.dart';

@SerializersFor([
  AuthResult,
  EthereumAddress,
])

/// This is the main serializer for the models in the app.
final Serializers modelSerializers = (_$modelSerializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(Iso8601DateTimeSerializer())
      ..add(Iso8601DurationSerializer()))
    .build();
