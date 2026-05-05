import 'package:built_collection/built_collection.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/iso_8601_duration_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

part 'entities.g.dart';

@SerializersFor([])

/// This is the main serializer for the entities in the app.
final Serializers entitySerializers = (_$entitySerializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(Iso8601DateTimeSerializer())
      ..add(Iso8601DurationSerializer()))
    .build();
