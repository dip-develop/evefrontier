// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solar_system_entity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SolarSystemEntity> _$solarSystemEntitySerializer =
    _$SolarSystemEntitySerializer();

class _$SolarSystemEntitySerializer
    implements StructuredSerializer<SolarSystemEntity> {
  @override
  final Iterable<Type> types = const [SolarSystemEntity, _$SolarSystemEntity];
  @override
  final String wireName = 'SolarSystemEntity';

  @override
  Iterable<Object?> serialize(Serializers serializers, SolarSystemEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(LocationEntity)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  SolarSystemEntity deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = SolarSystemEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'location':
          result.location.replace(serializers.deserialize(value,
                  specifiedType: const FullType(LocationEntity))!
              as LocationEntity);
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

class _$SolarSystemEntity extends SolarSystemEntity {
  @override
  final int id;
  @override
  final LocationEntity location;
  @override
  final String name;

  factory _$SolarSystemEntity(
          [void Function(SolarSystemEntityBuilder)? updates]) =>
      (SolarSystemEntityBuilder()..update(updates))._build();

  _$SolarSystemEntity._(
      {required this.id, required this.location, required this.name})
      : super._();
  @override
  SolarSystemEntity rebuild(void Function(SolarSystemEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SolarSystemEntityBuilder toBuilder() =>
      SolarSystemEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SolarSystemEntity &&
        id == other.id &&
        location == other.location &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SolarSystemEntity')
          ..add('id', id)
          ..add('location', location)
          ..add('name', name))
        .toString();
  }
}

class SolarSystemEntityBuilder
    implements Builder<SolarSystemEntity, SolarSystemEntityBuilder> {
  _$SolarSystemEntity? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  LocationEntityBuilder? _location;
  LocationEntityBuilder get location =>
      _$this._location ??= LocationEntityBuilder();
  set location(LocationEntityBuilder? location) => _$this._location = location;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  SolarSystemEntityBuilder();

  SolarSystemEntityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _location = $v.location.toBuilder();
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SolarSystemEntity other) {
    _$v = other as _$SolarSystemEntity;
  }

  @override
  void update(void Function(SolarSystemEntityBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SolarSystemEntity build() => _build();

  _$SolarSystemEntity _build() {
    _$SolarSystemEntity _$result;
    try {
      _$result = _$v ??
          _$SolarSystemEntity._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'SolarSystemEntity', 'id'),
            location: location.build(),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'SolarSystemEntity', 'name'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'location';
        location.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'SolarSystemEntity', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
