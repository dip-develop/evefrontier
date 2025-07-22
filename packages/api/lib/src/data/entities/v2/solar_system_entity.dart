import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'location_entity.dart';

part 'solar_system_entity.g.dart';

/// This class represents a solar system entity, which includes its location,
abstract class SolarSystemEntity
    implements Built<SolarSystemEntity, SolarSystemEntityBuilder> {
  static Serializer<SolarSystemEntity> get serializer =>
      _$solarSystemEntitySerializer;

  int get id;
  LocationEntity get location;
  String get name;

  SolarSystemEntity._();
  factory SolarSystemEntity([void Function(SolarSystemEntityBuilder) updates]) =
      _$SolarSystemEntity;
}
