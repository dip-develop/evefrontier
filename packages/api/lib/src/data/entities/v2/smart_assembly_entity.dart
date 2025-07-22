import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../entities.dart';

part 'smart_assembly_entity.g.dart';

/// This class represents a smart assembly entity, which includes various properties
abstract class SmartAssemblyEntity
    implements Built<SmartAssemblyEntity, SmartAssemblyEntityBuilder> {
  static Serializer<SmartAssemblyEntity> get serializer =>
      _$smartAssemblyEntitySerializer;

  int get energyUsage;
  String get id;
  String get name;
  SmartCharacterEntity get owner;
  SolarSystemEntity get solarSystem;
  SmartAssemblyStateEnum get state;
  SmartAssemblyTypeEnum get type;
  TypeEntity get typeDetails;

  int get typeId;

  SmartAssemblyEntity._();
  factory SmartAssemblyEntity(
          [void Function(SmartAssemblyEntityBuilder) updates]) =
      _$SmartAssemblyEntity;
}
