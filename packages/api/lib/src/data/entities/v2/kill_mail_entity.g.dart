// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kill_mail_entity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<KillMailEntity> _$killMailEntitySerializer =
    _$KillMailEntitySerializer();

class _$KillMailEntitySerializer
    implements StructuredSerializer<KillMailEntity> {
  @override
  final Iterable<Type> types = const [KillMailEntity, _$KillMailEntity];
  @override
  final String wireName = 'KillMailEntity';

  @override
  Iterable<Object?> serialize(Serializers serializers, KillMailEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'killer',
      serializers.serialize(object.killer,
          specifiedType: const FullType(SmartCharacterEntity)),
      'solarSystemId',
      serializers.serialize(object.solarSystemId,
          specifiedType: const FullType(int)),
      'time',
      serializers.serialize(object.time,
          specifiedType: const FullType(DateTime)),
      'victim',
      serializers.serialize(object.victim,
          specifiedType: const FullType(SmartCharacterEntity)),
    ];

    return result;
  }

  @override
  KillMailEntity deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = KillMailEntityBuilder();

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
        case 'killer':
          result.killer.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SmartCharacterEntity))!
              as SmartCharacterEntity);
          break;
        case 'solarSystemId':
          result.solarSystemId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(DateTime))! as DateTime;
          break;
        case 'victim':
          result.victim.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SmartCharacterEntity))!
              as SmartCharacterEntity);
          break;
      }
    }

    return result.build();
  }
}

class _$KillMailEntity extends KillMailEntity {
  @override
  final int id;
  @override
  final SmartCharacterEntity killer;
  @override
  final int solarSystemId;
  @override
  final DateTime time;
  @override
  final SmartCharacterEntity victim;

  factory _$KillMailEntity([void Function(KillMailEntityBuilder)? updates]) =>
      (KillMailEntityBuilder()..update(updates))._build();

  _$KillMailEntity._(
      {required this.id,
      required this.killer,
      required this.solarSystemId,
      required this.time,
      required this.victim})
      : super._();
  @override
  KillMailEntity rebuild(void Function(KillMailEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  KillMailEntityBuilder toBuilder() => KillMailEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is KillMailEntity &&
        id == other.id &&
        killer == other.killer &&
        solarSystemId == other.solarSystemId &&
        time == other.time &&
        victim == other.victim;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, killer.hashCode);
    _$hash = $jc(_$hash, solarSystemId.hashCode);
    _$hash = $jc(_$hash, time.hashCode);
    _$hash = $jc(_$hash, victim.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'KillMailEntity')
          ..add('id', id)
          ..add('killer', killer)
          ..add('solarSystemId', solarSystemId)
          ..add('time', time)
          ..add('victim', victim))
        .toString();
  }
}

class KillMailEntityBuilder
    implements Builder<KillMailEntity, KillMailEntityBuilder> {
  _$KillMailEntity? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  SmartCharacterEntityBuilder? _killer;
  SmartCharacterEntityBuilder get killer =>
      _$this._killer ??= SmartCharacterEntityBuilder();
  set killer(SmartCharacterEntityBuilder? killer) => _$this._killer = killer;

  int? _solarSystemId;
  int? get solarSystemId => _$this._solarSystemId;
  set solarSystemId(int? solarSystemId) =>
      _$this._solarSystemId = solarSystemId;

  DateTime? _time;
  DateTime? get time => _$this._time;
  set time(DateTime? time) => _$this._time = time;

  SmartCharacterEntityBuilder? _victim;
  SmartCharacterEntityBuilder get victim =>
      _$this._victim ??= SmartCharacterEntityBuilder();
  set victim(SmartCharacterEntityBuilder? victim) => _$this._victim = victim;

  KillMailEntityBuilder();

  KillMailEntityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _killer = $v.killer.toBuilder();
      _solarSystemId = $v.solarSystemId;
      _time = $v.time;
      _victim = $v.victim.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(KillMailEntity other) {
    _$v = other as _$KillMailEntity;
  }

  @override
  void update(void Function(KillMailEntityBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  KillMailEntity build() => _build();

  _$KillMailEntity _build() {
    _$KillMailEntity _$result;
    try {
      _$result = _$v ??
          _$KillMailEntity._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'KillMailEntity', 'id'),
            killer: killer.build(),
            solarSystemId: BuiltValueNullFieldError.checkNotNull(
                solarSystemId, r'KillMailEntity', 'solarSystemId'),
            time: BuiltValueNullFieldError.checkNotNull(
                time, r'KillMailEntity', 'time'),
            victim: victim.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'killer';
        killer.build();

        _$failedField = 'victim';
        victim.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'KillMailEntity', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
