// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fuel_entity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FuelEntity> _$fuelEntitySerializer = _$FuelEntitySerializer();

class _$FuelEntitySerializer implements StructuredSerializer<FuelEntity> {
  @override
  final Iterable<Type> types = const [FuelEntity, _$FuelEntity];
  @override
  final String wireName = 'FuelEntity';

  @override
  Iterable<Object?> serialize(Serializers serializers, FuelEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'efficiency',
      serializers.serialize(object.efficiency,
          specifiedType: const FullType(int)),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(TypeEntity)),
    ];

    return result;
  }

  @override
  FuelEntity deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = FuelEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'efficiency':
          result.efficiency = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'type':
          result.type.replace(serializers.deserialize(value,
              specifiedType: const FullType(TypeEntity))! as TypeEntity);
          break;
      }
    }

    return result.build();
  }
}

class _$FuelEntity extends FuelEntity {
  @override
  final int efficiency;
  @override
  final TypeEntity type;

  factory _$FuelEntity([void Function(FuelEntityBuilder)? updates]) =>
      (FuelEntityBuilder()..update(updates))._build();

  _$FuelEntity._({required this.efficiency, required this.type}) : super._();
  @override
  FuelEntity rebuild(void Function(FuelEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FuelEntityBuilder toBuilder() => FuelEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FuelEntity &&
        efficiency == other.efficiency &&
        type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, efficiency.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FuelEntity')
          ..add('efficiency', efficiency)
          ..add('type', type))
        .toString();
  }
}

class FuelEntityBuilder implements Builder<FuelEntity, FuelEntityBuilder> {
  _$FuelEntity? _$v;

  int? _efficiency;
  int? get efficiency => _$this._efficiency;
  set efficiency(int? efficiency) => _$this._efficiency = efficiency;

  TypeEntityBuilder? _type;
  TypeEntityBuilder get type => _$this._type ??= TypeEntityBuilder();
  set type(TypeEntityBuilder? type) => _$this._type = type;

  FuelEntityBuilder();

  FuelEntityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _efficiency = $v.efficiency;
      _type = $v.type.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FuelEntity other) {
    _$v = other as _$FuelEntity;
  }

  @override
  void update(void Function(FuelEntityBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FuelEntity build() => _build();

  _$FuelEntity _build() {
    _$FuelEntity _$result;
    try {
      _$result = _$v ??
          _$FuelEntity._(
            efficiency: BuiltValueNullFieldError.checkNotNull(
                efficiency, r'FuelEntity', 'efficiency'),
            type: type.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'type';
        type.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'FuelEntity', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
