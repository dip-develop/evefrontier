// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scanned_object_entity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ScannedObjectEntity> _$scannedObjectEntitySerializer =
    _$ScannedObjectEntitySerializer();

class _$ScannedObjectEntitySerializer
    implements StructuredSerializer<ScannedObjectEntity> {
  @override
  final Iterable<Type> types = const [
    ScannedObjectEntity,
    _$ScannedObjectEntity
  ];
  @override
  final String wireName = 'ScannedObjectEntity';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ScannedObjectEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'mass',
      serializers.serialize(object.mass, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'owner',
      serializers.serialize(object.owner,
          specifiedType: const FullType(String)),
      'typeID',
      serializers.serialize(object.typeID, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  ScannedObjectEntity deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ScannedObjectEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'mass':
          result.mass = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'owner':
          result.owner = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'typeID':
          result.typeID = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$ScannedObjectEntity extends ScannedObjectEntity {
  @override
  final int mass;
  @override
  final String name;
  @override
  final String owner;
  @override
  final int typeID;

  factory _$ScannedObjectEntity(
          [void Function(ScannedObjectEntityBuilder)? updates]) =>
      (ScannedObjectEntityBuilder()..update(updates))._build();

  _$ScannedObjectEntity._(
      {required this.mass,
      required this.name,
      required this.owner,
      required this.typeID})
      : super._();
  @override
  ScannedObjectEntity rebuild(
          void Function(ScannedObjectEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScannedObjectEntityBuilder toBuilder() =>
      ScannedObjectEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScannedObjectEntity &&
        mass == other.mass &&
        name == other.name &&
        owner == other.owner &&
        typeID == other.typeID;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, mass.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, owner.hashCode);
    _$hash = $jc(_$hash, typeID.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ScannedObjectEntity')
          ..add('mass', mass)
          ..add('name', name)
          ..add('owner', owner)
          ..add('typeID', typeID))
        .toString();
  }
}

class ScannedObjectEntityBuilder
    implements Builder<ScannedObjectEntity, ScannedObjectEntityBuilder> {
  _$ScannedObjectEntity? _$v;

  int? _mass;
  int? get mass => _$this._mass;
  set mass(int? mass) => _$this._mass = mass;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _owner;
  String? get owner => _$this._owner;
  set owner(String? owner) => _$this._owner = owner;

  int? _typeID;
  int? get typeID => _$this._typeID;
  set typeID(int? typeID) => _$this._typeID = typeID;

  ScannedObjectEntityBuilder();

  ScannedObjectEntityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _mass = $v.mass;
      _name = $v.name;
      _owner = $v.owner;
      _typeID = $v.typeID;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ScannedObjectEntity other) {
    _$v = other as _$ScannedObjectEntity;
  }

  @override
  void update(void Function(ScannedObjectEntityBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ScannedObjectEntity build() => _build();

  _$ScannedObjectEntity _build() {
    final _$result = _$v ??
        _$ScannedObjectEntity._(
          mass: BuiltValueNullFieldError.checkNotNull(
              mass, r'ScannedObjectEntity', 'mass'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'ScannedObjectEntity', 'name'),
          owner: BuiltValueNullFieldError.checkNotNull(
              owner, r'ScannedObjectEntity', 'owner'),
          typeID: BuiltValueNullFieldError.checkNotNull(
              typeID, r'ScannedObjectEntity', 'typeID'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
