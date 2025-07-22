import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'smart_assembly_type_enum.g.dart';

/// This class represents a smart assembly entity, which includes various properties
class SmartAssemblyTypeEnum extends EnumClass {
  static Serializer<SmartAssemblyTypeEnum> get serializer =>
      _$smartAssemblyTypeEnumSerializer;

  @BuiltValueEnumConst(wireName: 'SmartStorageUnit')
  static const SmartAssemblyTypeEnum smartStorageUnit = _$smartStorageUnit;
  @BuiltValueEnumConst(wireName: 'SmartTurret')
  static const SmartAssemblyTypeEnum smartTurret = _$smartTurret;
  @BuiltValueEnumConst(wireName: 'SmartGate')
  static const SmartAssemblyTypeEnum smartGate = _$smartGate;
  @BuiltValueEnumConst(wireName: 'Unknown')
  static const SmartAssemblyTypeEnum unknown = _$unknown;

  const SmartAssemblyTypeEnum._(super.name);

  static BuiltSet<SmartAssemblyTypeEnum> get values => _$values;
  static SmartAssemblyTypeEnum valueOf(String name) => _$valueOf(name);
}
