// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ship_entity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ShipEntity> _$shipEntitySerializer = _$ShipEntitySerializer();

class _$ShipEntitySerializer implements StructuredSerializer<ShipEntity> {
  @override
  final Iterable<Type> types = const [ShipEntity, _$ShipEntity];
  @override
  final String wireName = 'ShipEntity';

  @override
  Iterable<Object?> serialize(Serializers serializers, ShipEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'instanceId',
      serializers.serialize(object.instanceId,
          specifiedType: const FullType(int)),
      'typeId',
      serializers.serialize(object.typeId,
          specifiedType: const FullType(SolarSystemEntity)),
    ];

    return result;
  }

  @override
  ShipEntity deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ShipEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'instanceId':
          result.instanceId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'typeId':
          result.typeId.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SolarSystemEntity))!
              as SolarSystemEntity);
          break;
      }
    }

    return result.build();
  }
}

class _$ShipEntity extends ShipEntity {
  @override
  final int instanceId;
  @override
  final SolarSystemEntity typeId;

  factory _$ShipEntity([void Function(ShipEntityBuilder)? updates]) =>
      (ShipEntityBuilder()..update(updates))._build();

  _$ShipEntity._({required this.instanceId, required this.typeId}) : super._();
  @override
  ShipEntity rebuild(void Function(ShipEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShipEntityBuilder toBuilder() => ShipEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShipEntity &&
        instanceId == other.instanceId &&
        typeId == other.typeId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, instanceId.hashCode);
    _$hash = $jc(_$hash, typeId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ShipEntity')
          ..add('instanceId', instanceId)
          ..add('typeId', typeId))
        .toString();
  }
}

class ShipEntityBuilder implements Builder<ShipEntity, ShipEntityBuilder> {
  _$ShipEntity? _$v;

  int? _instanceId;
  int? get instanceId => _$this._instanceId;
  set instanceId(int? instanceId) => _$this._instanceId = instanceId;

  SolarSystemEntityBuilder? _typeId;
  SolarSystemEntityBuilder get typeId =>
      _$this._typeId ??= SolarSystemEntityBuilder();
  set typeId(SolarSystemEntityBuilder? typeId) => _$this._typeId = typeId;

  ShipEntityBuilder();

  ShipEntityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _instanceId = $v.instanceId;
      _typeId = $v.typeId.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShipEntity other) {
    _$v = other as _$ShipEntity;
  }

  @override
  void update(void Function(ShipEntityBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ShipEntity build() => _build();

  _$ShipEntity _build() {
    _$ShipEntity _$result;
    try {
      _$result = _$v ??
          _$ShipEntity._(
            instanceId: BuiltValueNullFieldError.checkNotNull(
                instanceId, r'ShipEntity', 'instanceId'),
            typeId: typeId.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'typeId';
        typeId.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ShipEntity', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
