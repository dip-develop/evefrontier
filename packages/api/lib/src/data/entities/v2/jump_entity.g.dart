// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jump_entity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<JumpEntity> _$jumpEntitySerializer = _$JumpEntitySerializer();

class _$JumpEntitySerializer implements StructuredSerializer<JumpEntity> {
  @override
  final Iterable<Type> types = const [JumpEntity, _$JumpEntity];
  @override
  final String wireName = 'JumpEntity';

  @override
  Iterable<Object?> serialize(Serializers serializers, JumpEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'destination',
      serializers.serialize(object.destination,
          specifiedType: const FullType(SolarSystemEntity)),
      'origin',
      serializers.serialize(object.origin,
          specifiedType: const FullType(SolarSystemEntity)),
      'ship',
      serializers.serialize(object.ship,
          specifiedType: const FullType(ShipEntity)),
      'time',
      serializers.serialize(object.time,
          specifiedType: const FullType(DateTime)),
    ];

    return result;
  }

  @override
  JumpEntity deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = JumpEntityBuilder();

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
        case 'destination':
          result.destination.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SolarSystemEntity))!
              as SolarSystemEntity);
          break;
        case 'origin':
          result.origin.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SolarSystemEntity))!
              as SolarSystemEntity);
          break;
        case 'ship':
          result.ship.replace(serializers.deserialize(value,
              specifiedType: const FullType(ShipEntity))! as ShipEntity);
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

class _$JumpEntity extends JumpEntity {
  @override
  final int id;
  @override
  final SolarSystemEntity destination;
  @override
  final SolarSystemEntity origin;
  @override
  final ShipEntity ship;
  @override
  final DateTime time;

  factory _$JumpEntity([void Function(JumpEntityBuilder)? updates]) =>
      (JumpEntityBuilder()..update(updates))._build();

  _$JumpEntity._(
      {required this.id,
      required this.destination,
      required this.origin,
      required this.ship,
      required this.time})
      : super._();
  @override
  JumpEntity rebuild(void Function(JumpEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  JumpEntityBuilder toBuilder() => JumpEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is JumpEntity &&
        id == other.id &&
        destination == other.destination &&
        origin == other.origin &&
        ship == other.ship &&
        time == other.time;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, destination.hashCode);
    _$hash = $jc(_$hash, origin.hashCode);
    _$hash = $jc(_$hash, ship.hashCode);
    _$hash = $jc(_$hash, time.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'JumpEntity')
          ..add('id', id)
          ..add('destination', destination)
          ..add('origin', origin)
          ..add('ship', ship)
          ..add('time', time))
        .toString();
  }
}

class JumpEntityBuilder implements Builder<JumpEntity, JumpEntityBuilder> {
  _$JumpEntity? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  SolarSystemEntityBuilder? _destination;
  SolarSystemEntityBuilder get destination =>
      _$this._destination ??= SolarSystemEntityBuilder();
  set destination(SolarSystemEntityBuilder? destination) =>
      _$this._destination = destination;

  SolarSystemEntityBuilder? _origin;
  SolarSystemEntityBuilder get origin =>
      _$this._origin ??= SolarSystemEntityBuilder();
  set origin(SolarSystemEntityBuilder? origin) => _$this._origin = origin;

  ShipEntityBuilder? _ship;
  ShipEntityBuilder get ship => _$this._ship ??= ShipEntityBuilder();
  set ship(ShipEntityBuilder? ship) => _$this._ship = ship;

  DateTime? _time;
  DateTime? get time => _$this._time;
  set time(DateTime? time) => _$this._time = time;

  JumpEntityBuilder();

  JumpEntityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _destination = $v.destination.toBuilder();
      _origin = $v.origin.toBuilder();
      _ship = $v.ship.toBuilder();
      _time = $v.time;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(JumpEntity other) {
    _$v = other as _$JumpEntity;
  }

  @override
  void update(void Function(JumpEntityBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  JumpEntity build() => _build();

  _$JumpEntity _build() {
    _$JumpEntity _$result;
    try {
      _$result = _$v ??
          _$JumpEntity._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'JumpEntity', 'id'),
            destination: destination.build(),
            origin: origin.build(),
            ship: ship.build(),
            time: BuiltValueNullFieldError.checkNotNull(
                time, r'JumpEntity', 'time'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'destination';
        destination.build();
        _$failedField = 'origin';
        origin.build();
        _$failedField = 'ship';
        ship.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'JumpEntity', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
