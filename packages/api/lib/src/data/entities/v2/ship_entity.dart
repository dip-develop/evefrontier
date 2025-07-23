import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../entities.dart';

part 'ship_entity.g.dart';

/// This class represents a ship entity in the game EVE Frontier.
abstract class ShipEntity implements Built<ShipEntity, ShipEntityBuilder> {
  static Serializer<ShipEntity> get serializer => _$shipEntitySerializer;

  int get instanceId;
  SolarSystemEntity get typeId;

  ShipEntity._();
  factory ShipEntity([void Function(ShipEntityBuilder) updates]) = _$ShipEntity;
}
