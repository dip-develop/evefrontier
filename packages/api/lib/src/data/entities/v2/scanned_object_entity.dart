import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'scanned_object_entity.g.dart';

/// This class represents a scanned object entity in the game EVE Frontier.
abstract class ScannedObjectEntity
    implements Built<ScannedObjectEntity, ScannedObjectEntityBuilder> {
  static Serializer<ScannedObjectEntity> get serializer =>
      _$scannedObjectEntitySerializer;

  int get mass;
  String get name;
  String get owner;
  int get typeID;

  ScannedObjectEntity._();
  factory ScannedObjectEntity(
          [void Function(ScannedObjectEntityBuilder) updates]) =
      _$ScannedObjectEntity;
}
