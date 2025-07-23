import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../entities.dart';

part 'jump_entity.g.dart';

/// This class represents a jump entity in the game EVE Frontier.
abstract class JumpEntity implements Built<JumpEntity, JumpEntityBuilder> {
  static Serializer<JumpEntity> get serializer => _$jumpEntitySerializer;

  int get id;
  SolarSystemEntity get destination;

  SolarSystemEntity get origin;
  ShipEntity get ship;
  DateTime get time;

  JumpEntity._();
  factory JumpEntity([void Function(JumpEntityBuilder) updates]) = _$JumpEntity;
}
