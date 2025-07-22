// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'healthy_entity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HealthyEntity> _$healthyEntitySerializer =
    _$HealthyEntitySerializer();

class _$HealthyEntitySerializer implements StructuredSerializer<HealthyEntity> {
  @override
  final Iterable<Type> types = const [HealthyEntity, _$HealthyEntity];
  @override
  final String wireName = 'HealthyEntity';

  @override
  Iterable<Object?> serialize(Serializers serializers, HealthyEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ok',
      serializers.serialize(object.ok, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  HealthyEntity deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = HealthyEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ok':
          result.ok = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$HealthyEntity extends HealthyEntity {
  @override
  final bool ok;

  factory _$HealthyEntity([void Function(HealthyEntityBuilder)? updates]) =>
      (HealthyEntityBuilder()..update(updates))._build();

  _$HealthyEntity._({required this.ok}) : super._();
  @override
  HealthyEntity rebuild(void Function(HealthyEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HealthyEntityBuilder toBuilder() => HealthyEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HealthyEntity && ok == other.ok;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ok.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HealthyEntity')..add('ok', ok))
        .toString();
  }
}

class HealthyEntityBuilder
    implements Builder<HealthyEntity, HealthyEntityBuilder> {
  _$HealthyEntity? _$v;

  bool? _ok;
  bool? get ok => _$this._ok;
  set ok(bool? ok) => _$this._ok = ok;

  HealthyEntityBuilder();

  HealthyEntityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ok = $v.ok;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HealthyEntity other) {
    _$v = other as _$HealthyEntity;
  }

  @override
  void update(void Function(HealthyEntityBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HealthyEntity build() => _build();

  _$HealthyEntity _build() {
    final _$result = _$v ??
        _$HealthyEntity._(
          ok: BuiltValueNullFieldError.checkNotNull(ok, r'HealthyEntity', 'ok'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
