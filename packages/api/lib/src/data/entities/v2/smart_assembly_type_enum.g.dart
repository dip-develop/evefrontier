// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_assembly_type_enum.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SmartAssemblyTypeEnum _$smartStorageUnit =
    const SmartAssemblyTypeEnum._('smartStorageUnit');
const SmartAssemblyTypeEnum _$smartTurret =
    const SmartAssemblyTypeEnum._('smartTurret');
const SmartAssemblyTypeEnum _$smartGate =
    const SmartAssemblyTypeEnum._('smartGate');
const SmartAssemblyTypeEnum _$unknown =
    const SmartAssemblyTypeEnum._('unknown');

SmartAssemblyTypeEnum _$valueOf(String name) {
  switch (name) {
    case 'smartStorageUnit':
      return _$smartStorageUnit;
    case 'smartTurret':
      return _$smartTurret;
    case 'smartGate':
      return _$smartGate;
    case 'unknown':
      return _$unknown;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<SmartAssemblyTypeEnum> _$values =
    BuiltSet<SmartAssemblyTypeEnum>(const <SmartAssemblyTypeEnum>[
  _$smartStorageUnit,
  _$smartTurret,
  _$smartGate,
  _$unknown,
]);

Serializer<SmartAssemblyTypeEnum> _$smartAssemblyTypeEnumSerializer =
    _$SmartAssemblyTypeEnumSerializer();

class _$SmartAssemblyTypeEnumSerializer
    implements PrimitiveSerializer<SmartAssemblyTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'smartStorageUnit': 'SmartStorageUnit',
    'smartTurret': 'SmartTurret',
    'smartGate': 'SmartGate',
    'unknown': 'Unknown',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'SmartStorageUnit': 'smartStorageUnit',
    'SmartTurret': 'smartTurret',
    'SmartGate': 'smartGate',
    'Unknown': 'unknown',
  };

  @override
  final Iterable<Type> types = const <Type>[SmartAssemblyTypeEnum];
  @override
  final String wireName = 'SmartAssemblyTypeEnum';

  @override
  Object serialize(Serializers serializers, SmartAssemblyTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  SmartAssemblyTypeEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SmartAssemblyTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
