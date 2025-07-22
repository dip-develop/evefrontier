import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'smart_character_entity.dart';

part 'kill_mail_entity.g.dart';

/// This class represents a kill mail entity in the game EVE Frontier.
abstract class KillMailEntity
    implements Built<KillMailEntity, KillMailEntityBuilder> {
  static Serializer<KillMailEntity> get serializer =>
      _$killMailEntitySerializer;

  int get id;
  SmartCharacterEntity get killer;
  int get solarSystemId;
  DateTime get time;
  SmartCharacterEntity get victim;

  KillMailEntity._();
  factory KillMailEntity([void Function(KillMailEntityBuilder) updates]) =
      _$KillMailEntity;
}
