import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'smart_character_entity.g.dart';

/// This class represents a character entity with an address and name.
abstract class SmartCharacterEntity
    implements Built<SmartCharacterEntity, SmartCharacterEntityBuilder> {
  static Serializer<SmartCharacterEntity> get serializer =>
      _$smartCharacterEntitySerializer;

  String get id;
  String get address;
  String get name;

  SmartCharacterEntity._();
  factory SmartCharacterEntity(
          [void Function(SmartCharacterEntityBuilder) updates]) =
      _$SmartCharacterEntity;
}
