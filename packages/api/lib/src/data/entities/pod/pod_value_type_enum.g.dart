// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pod_value_type_enum.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const PodValueTypeEnum _$string = const PodValueTypeEnum._('string');
const PodValueTypeEnum _$bytes = const PodValueTypeEnum._('bytes');
const PodValueTypeEnum _$cryptographic =
    const PodValueTypeEnum._('cryptographic');
const PodValueTypeEnum _$int = const PodValueTypeEnum._('int');
const PodValueTypeEnum _$boolean = const PodValueTypeEnum._('boolean');
const PodValueTypeEnum _$eddsaPubKey = const PodValueTypeEnum._('eddsaPubKey');
const PodValueTypeEnum _$date = const PodValueTypeEnum._('date');
const PodValueTypeEnum _$array = const PodValueTypeEnum._('array');
const PodValueTypeEnum _$map = const PodValueTypeEnum._('map');

PodValueTypeEnum _$valueOf(String name) {
  switch (name) {
    case 'string':
      return _$string;
    case 'bytes':
      return _$bytes;
    case 'cryptographic':
      return _$cryptographic;
    case 'int':
      return _$int;
    case 'boolean':
      return _$boolean;
    case 'eddsaPubKey':
      return _$eddsaPubKey;
    case 'date':
      return _$date;
    case 'array':
      return _$array;
    case 'map':
      return _$map;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<PodValueTypeEnum> _$values =
    BuiltSet<PodValueTypeEnum>(const <PodValueTypeEnum>[
  _$string,
  _$bytes,
  _$cryptographic,
  _$int,
  _$boolean,
  _$eddsaPubKey,
  _$date,
  _$array,
  _$map,
]);

Serializer<PodValueTypeEnum> _$podValueTypeEnumSerializer =
    _$PodValueTypeEnumSerializer();

class _$PodValueTypeEnumSerializer
    implements PrimitiveSerializer<PodValueTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'eddsaPubKey': 'eddsa_pubkey',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'eddsa_pubkey': 'eddsaPubKey',
  };

  @override
  final Iterable<Type> types = const <Type>[PodValueTypeEnum];
  @override
  final String wireName = 'PodValueTypeEnum';

  @override
  Object serialize(Serializers serializers, PodValueTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  PodValueTypeEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      PodValueTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
