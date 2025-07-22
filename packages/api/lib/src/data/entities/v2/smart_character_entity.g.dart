// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_character_entity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SmartCharacterEntity> _$smartCharacterEntitySerializer =
    _$SmartCharacterEntitySerializer();

class _$SmartCharacterEntitySerializer
    implements StructuredSerializer<SmartCharacterEntity> {
  @override
  final Iterable<Type> types = const [
    SmartCharacterEntity,
    _$SmartCharacterEntity
  ];
  @override
  final String wireName = 'SmartCharacterEntity';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SmartCharacterEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  SmartCharacterEntity deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = SmartCharacterEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$SmartCharacterEntity extends SmartCharacterEntity {
  @override
  final String id;
  @override
  final String address;
  @override
  final String name;

  factory _$SmartCharacterEntity(
          [void Function(SmartCharacterEntityBuilder)? updates]) =>
      (SmartCharacterEntityBuilder()..update(updates))._build();

  _$SmartCharacterEntity._(
      {required this.id, required this.address, required this.name})
      : super._();
  @override
  SmartCharacterEntity rebuild(
          void Function(SmartCharacterEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SmartCharacterEntityBuilder toBuilder() =>
      SmartCharacterEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SmartCharacterEntity &&
        id == other.id &&
        address == other.address &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SmartCharacterEntity')
          ..add('id', id)
          ..add('address', address)
          ..add('name', name))
        .toString();
  }
}

class SmartCharacterEntityBuilder
    implements Builder<SmartCharacterEntity, SmartCharacterEntityBuilder> {
  _$SmartCharacterEntity? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  SmartCharacterEntityBuilder();

  SmartCharacterEntityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _address = $v.address;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SmartCharacterEntity other) {
    _$v = other as _$SmartCharacterEntity;
  }

  @override
  void update(void Function(SmartCharacterEntityBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SmartCharacterEntity build() => _build();

  _$SmartCharacterEntity _build() {
    final _$result = _$v ??
        _$SmartCharacterEntity._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'SmartCharacterEntity', 'id'),
          address: BuiltValueNullFieldError.checkNotNull(
              address, r'SmartCharacterEntity', 'address'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'SmartCharacterEntity', 'name'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
