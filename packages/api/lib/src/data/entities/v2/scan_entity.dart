import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../entities.dart';

part 'scan_entity.g.dart';

/// This class represents a scan entity in the game EVE Frontier.
abstract class ScanEntity implements Built<ScanEntity, ScanEntityBuilder> {
  static Serializer<ScanEntity> get serializer => _$scanEntitySerializer;

  int get id;
  SolarSystemEntity get location;
  ScannedObjectEntity get scannedObject;
  DateTime get time;

  ScanEntity._();
  factory ScanEntity([void Function(ScanEntityBuilder) updates]) = _$ScanEntity;
}
