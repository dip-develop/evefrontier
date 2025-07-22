import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'smart_assembly_state_enum.g.dart';

/// This class represents a smart assembly entity, which includes various properties
class SmartAssemblyStateEnum extends EnumClass {
  static Serializer<SmartAssemblyStateEnum> get serializer =>
      _$smartAssemblyStateEnumSerializer;

  static const SmartAssemblyStateEnum unknown = _$unknown;
  static const SmartAssemblyStateEnum unanchored = _$unanchored;
  static const SmartAssemblyStateEnum anchored = _$anchored;
  static const SmartAssemblyStateEnum online = _$online;
  static const SmartAssemblyStateEnum offline = _$offline;
  static const SmartAssemblyStateEnum destroyed = _$destroyed;

  const SmartAssemblyStateEnum._(super.name);

  static BuiltSet<SmartAssemblyStateEnum> get values => _$values;
  static SmartAssemblyStateEnum valueOf(String name) => _$valueOf(name);
}
