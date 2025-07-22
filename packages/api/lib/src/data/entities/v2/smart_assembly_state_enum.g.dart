// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_assembly_state_enum.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SmartAssemblyStateEnum _$unknown =
    const SmartAssemblyStateEnum._('unknown');
const SmartAssemblyStateEnum _$unanchored =
    const SmartAssemblyStateEnum._('unanchored');
const SmartAssemblyStateEnum _$anchored =
    const SmartAssemblyStateEnum._('anchored');
const SmartAssemblyStateEnum _$online =
    const SmartAssemblyStateEnum._('online');
const SmartAssemblyStateEnum _$offline =
    const SmartAssemblyStateEnum._('offline');
const SmartAssemblyStateEnum _$destroyed =
    const SmartAssemblyStateEnum._('destroyed');

SmartAssemblyStateEnum _$valueOf(String name) {
  switch (name) {
    case 'unknown':
      return _$unknown;
    case 'unanchored':
      return _$unanchored;
    case 'anchored':
      return _$anchored;
    case 'online':
      return _$online;
    case 'offline':
      return _$offline;
    case 'destroyed':
      return _$destroyed;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<SmartAssemblyStateEnum> _$values =
    BuiltSet<SmartAssemblyStateEnum>(const <SmartAssemblyStateEnum>[
  _$unknown,
  _$unanchored,
  _$anchored,
  _$online,
  _$offline,
  _$destroyed,
]);

Serializer<SmartAssemblyStateEnum> _$smartAssemblyStateEnumSerializer =
    _$SmartAssemblyStateEnumSerializer();

class _$SmartAssemblyStateEnumSerializer
    implements PrimitiveSerializer<SmartAssemblyStateEnum> {
  @override
  final Iterable<Type> types = const <Type>[SmartAssemblyStateEnum];
  @override
  final String wireName = 'SmartAssemblyStateEnum';

  @override
  Object serialize(Serializers serializers, SmartAssemblyStateEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  SmartAssemblyStateEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SmartAssemblyStateEnum.valueOf(serialized as String);
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
