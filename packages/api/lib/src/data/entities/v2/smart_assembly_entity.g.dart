// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_assembly_entity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SmartAssemblyEntity> _$smartAssemblyEntitySerializer =
    _$SmartAssemblyEntitySerializer();

class _$SmartAssemblyEntitySerializer
    implements StructuredSerializer<SmartAssemblyEntity> {
  @override
  final Iterable<Type> types = const [
    SmartAssemblyEntity,
    _$SmartAssemblyEntity
  ];
  @override
  final String wireName = 'SmartAssemblyEntity';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SmartAssemblyEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'energyUsage',
      serializers.serialize(object.energyUsage,
          specifiedType: const FullType(int)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'owner',
      serializers.serialize(object.owner,
          specifiedType: const FullType(SmartCharacterEntity)),
      'solarSystem',
      serializers.serialize(object.solarSystem,
          specifiedType: const FullType(SolarSystemEntity)),
      'state',
      serializers.serialize(object.state,
          specifiedType: const FullType(SmartAssemblyStateEnum)),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(SmartAssemblyTypeEnum)),
      'typeDetails',
      serializers.serialize(object.typeDetails,
          specifiedType: const FullType(TypeEntity)),
      'typeId',
      serializers.serialize(object.typeId, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  SmartAssemblyEntity deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = SmartAssemblyEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'energyUsage':
          result.energyUsage = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'owner':
          result.owner.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SmartCharacterEntity))!
              as SmartCharacterEntity);
          break;
        case 'solarSystem':
          result.solarSystem.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SolarSystemEntity))!
              as SolarSystemEntity);
          break;
        case 'state':
          result.state = serializers.deserialize(value,
                  specifiedType: const FullType(SmartAssemblyStateEnum))!
              as SmartAssemblyStateEnum;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
                  specifiedType: const FullType(SmartAssemblyTypeEnum))!
              as SmartAssemblyTypeEnum;
          break;
        case 'typeDetails':
          result.typeDetails.replace(serializers.deserialize(value,
              specifiedType: const FullType(TypeEntity))! as TypeEntity);
          break;
        case 'typeId':
          result.typeId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$SmartAssemblyEntity extends SmartAssemblyEntity {
  @override
  final int energyUsage;
  @override
  final String id;
  @override
  final String name;
  @override
  final SmartCharacterEntity owner;
  @override
  final SolarSystemEntity solarSystem;
  @override
  final SmartAssemblyStateEnum state;
  @override
  final SmartAssemblyTypeEnum type;
  @override
  final TypeEntity typeDetails;
  @override
  final int typeId;

  factory _$SmartAssemblyEntity(
          [void Function(SmartAssemblyEntityBuilder)? updates]) =>
      (SmartAssemblyEntityBuilder()..update(updates))._build();

  _$SmartAssemblyEntity._(
      {required this.energyUsage,
      required this.id,
      required this.name,
      required this.owner,
      required this.solarSystem,
      required this.state,
      required this.type,
      required this.typeDetails,
      required this.typeId})
      : super._();
  @override
  SmartAssemblyEntity rebuild(
          void Function(SmartAssemblyEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SmartAssemblyEntityBuilder toBuilder() =>
      SmartAssemblyEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SmartAssemblyEntity &&
        energyUsage == other.energyUsage &&
        id == other.id &&
        name == other.name &&
        owner == other.owner &&
        solarSystem == other.solarSystem &&
        state == other.state &&
        type == other.type &&
        typeDetails == other.typeDetails &&
        typeId == other.typeId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, energyUsage.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, owner.hashCode);
    _$hash = $jc(_$hash, solarSystem.hashCode);
    _$hash = $jc(_$hash, state.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, typeDetails.hashCode);
    _$hash = $jc(_$hash, typeId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SmartAssemblyEntity')
          ..add('energyUsage', energyUsage)
          ..add('id', id)
          ..add('name', name)
          ..add('owner', owner)
          ..add('solarSystem', solarSystem)
          ..add('state', state)
          ..add('type', type)
          ..add('typeDetails', typeDetails)
          ..add('typeId', typeId))
        .toString();
  }
}

class SmartAssemblyEntityBuilder
    implements Builder<SmartAssemblyEntity, SmartAssemblyEntityBuilder> {
  _$SmartAssemblyEntity? _$v;

  int? _energyUsage;
  int? get energyUsage => _$this._energyUsage;
  set energyUsage(int? energyUsage) => _$this._energyUsage = energyUsage;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  SmartCharacterEntityBuilder? _owner;
  SmartCharacterEntityBuilder get owner =>
      _$this._owner ??= SmartCharacterEntityBuilder();
  set owner(SmartCharacterEntityBuilder? owner) => _$this._owner = owner;

  SolarSystemEntityBuilder? _solarSystem;
  SolarSystemEntityBuilder get solarSystem =>
      _$this._solarSystem ??= SolarSystemEntityBuilder();
  set solarSystem(SolarSystemEntityBuilder? solarSystem) =>
      _$this._solarSystem = solarSystem;

  SmartAssemblyStateEnum? _state;
  SmartAssemblyStateEnum? get state => _$this._state;
  set state(SmartAssemblyStateEnum? state) => _$this._state = state;

  SmartAssemblyTypeEnum? _type;
  SmartAssemblyTypeEnum? get type => _$this._type;
  set type(SmartAssemblyTypeEnum? type) => _$this._type = type;

  TypeEntityBuilder? _typeDetails;
  TypeEntityBuilder get typeDetails =>
      _$this._typeDetails ??= TypeEntityBuilder();
  set typeDetails(TypeEntityBuilder? typeDetails) =>
      _$this._typeDetails = typeDetails;

  int? _typeId;
  int? get typeId => _$this._typeId;
  set typeId(int? typeId) => _$this._typeId = typeId;

  SmartAssemblyEntityBuilder();

  SmartAssemblyEntityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _energyUsage = $v.energyUsage;
      _id = $v.id;
      _name = $v.name;
      _owner = $v.owner.toBuilder();
      _solarSystem = $v.solarSystem.toBuilder();
      _state = $v.state;
      _type = $v.type;
      _typeDetails = $v.typeDetails.toBuilder();
      _typeId = $v.typeId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SmartAssemblyEntity other) {
    _$v = other as _$SmartAssemblyEntity;
  }

  @override
  void update(void Function(SmartAssemblyEntityBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SmartAssemblyEntity build() => _build();

  _$SmartAssemblyEntity _build() {
    _$SmartAssemblyEntity _$result;
    try {
      _$result = _$v ??
          _$SmartAssemblyEntity._(
            energyUsage: BuiltValueNullFieldError.checkNotNull(
                energyUsage, r'SmartAssemblyEntity', 'energyUsage'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'SmartAssemblyEntity', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'SmartAssemblyEntity', 'name'),
            owner: owner.build(),
            solarSystem: solarSystem.build(),
            state: BuiltValueNullFieldError.checkNotNull(
                state, r'SmartAssemblyEntity', 'state'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'SmartAssemblyEntity', 'type'),
            typeDetails: typeDetails.build(),
            typeId: BuiltValueNullFieldError.checkNotNull(
                typeId, r'SmartAssemblyEntity', 'typeId'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'owner';
        owner.build();
        _$failedField = 'solarSystem';
        solarSystem.build();

        _$failedField = 'typeDetails';
        typeDetails.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'SmartAssemblyEntity', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
