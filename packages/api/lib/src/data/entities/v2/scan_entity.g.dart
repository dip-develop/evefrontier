// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_entity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ScanEntity> _$scanEntitySerializer = _$ScanEntitySerializer();

class _$ScanEntitySerializer implements StructuredSerializer<ScanEntity> {
  @override
  final Iterable<Type> types = const [ScanEntity, _$ScanEntity];
  @override
  final String wireName = 'ScanEntity';

  @override
  Iterable<Object?> serialize(Serializers serializers, ScanEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(SolarSystemEntity)),
      'scannedObject',
      serializers.serialize(object.scannedObject,
          specifiedType: const FullType(ScannedObjectEntity)),
      'time',
      serializers.serialize(object.time,
          specifiedType: const FullType(DateTime)),
    ];

    return result;
  }

  @override
  ScanEntity deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ScanEntityBuilder();

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
                  specifiedType: const FullType(SolarSystemEntity))!
              as SolarSystemEntity);
          break;
        case 'scannedObject':
          result.scannedObject.replace(serializers.deserialize(value,
                  specifiedType: const FullType(ScannedObjectEntity))!
              as ScannedObjectEntity);
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(DateTime))! as DateTime;
          break;
      }
    }

    return result.build();
  }
}

class _$ScanEntity extends ScanEntity {
  @override
  final int id;
  @override
  final SolarSystemEntity location;
  @override
  final ScannedObjectEntity scannedObject;
  @override
  final DateTime time;

  factory _$ScanEntity([void Function(ScanEntityBuilder)? updates]) =>
      (ScanEntityBuilder()..update(updates))._build();

  _$ScanEntity._(
      {required this.id,
      required this.location,
      required this.scannedObject,
      required this.time})
      : super._();
  @override
  ScanEntity rebuild(void Function(ScanEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScanEntityBuilder toBuilder() => ScanEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScanEntity &&
        id == other.id &&
        location == other.location &&
        scannedObject == other.scannedObject &&
        time == other.time;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, scannedObject.hashCode);
    _$hash = $jc(_$hash, time.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ScanEntity')
          ..add('id', id)
          ..add('location', location)
          ..add('scannedObject', scannedObject)
          ..add('time', time))
        .toString();
  }
}

class ScanEntityBuilder implements Builder<ScanEntity, ScanEntityBuilder> {
  _$ScanEntity? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  SolarSystemEntityBuilder? _location;
  SolarSystemEntityBuilder get location =>
      _$this._location ??= SolarSystemEntityBuilder();
  set location(SolarSystemEntityBuilder? location) =>
      _$this._location = location;

  ScannedObjectEntityBuilder? _scannedObject;
  ScannedObjectEntityBuilder get scannedObject =>
      _$this._scannedObject ??= ScannedObjectEntityBuilder();
  set scannedObject(ScannedObjectEntityBuilder? scannedObject) =>
      _$this._scannedObject = scannedObject;

  DateTime? _time;
  DateTime? get time => _$this._time;
  set time(DateTime? time) => _$this._time = time;

  ScanEntityBuilder();

  ScanEntityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _location = $v.location.toBuilder();
      _scannedObject = $v.scannedObject.toBuilder();
      _time = $v.time;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ScanEntity other) {
    _$v = other as _$ScanEntity;
  }

  @override
  void update(void Function(ScanEntityBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ScanEntity build() => _build();

  _$ScanEntity _build() {
    _$ScanEntity _$result;
    try {
      _$result = _$v ??
          _$ScanEntity._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'ScanEntity', 'id'),
            location: location.build(),
            scannedObject: scannedObject.build(),
            time: BuiltValueNullFieldError.checkNotNull(
                time, r'ScanEntity', 'time'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'location';
        location.build();
        _$failedField = 'scannedObject';
        scannedObject.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ScanEntity', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
