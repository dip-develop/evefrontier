// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pod_entry.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PodEntity> _$podEntitySerializer = _$PodEntitySerializer();

class _$PodEntitySerializer implements StructuredSerializer<PodEntity> {
  @override
  final Iterable<Type> types = const [PodEntity, _$PodEntity];
  @override
  final String wireName = 'PodEntity';

  @override
  Iterable<Object?> serialize(Serializers serializers, PodEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'entries',
      serializers.serialize(object.entries,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(String), const FullType(PodValueEntity)])),
      'signature',
      serializers.serialize(object.signature,
          specifiedType: const FullType(String)),
      'signerPublicKey',
      serializers.serialize(object.signerPublicKey,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  PodEntity deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = PodEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'entries':
          result.entries.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(PodValueEntity)
              ]))!);
          break;
        case 'signature':
          result.signature = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'signerPublicKey':
          result.signerPublicKey = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PodEntity extends PodEntity {
  @override
  final BuiltMap<String, PodValueEntity> entries;
  @override
  final String signature;
  @override
  final String signerPublicKey;

  factory _$PodEntity([void Function(PodEntityBuilder)? updates]) =>
      (PodEntityBuilder()..update(updates))._build();

  _$PodEntity._(
      {required this.entries,
      required this.signature,
      required this.signerPublicKey})
      : super._();
  @override
  PodEntity rebuild(void Function(PodEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PodEntityBuilder toBuilder() => PodEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PodEntity &&
        entries == other.entries &&
        signature == other.signature &&
        signerPublicKey == other.signerPublicKey;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, entries.hashCode);
    _$hash = $jc(_$hash, signature.hashCode);
    _$hash = $jc(_$hash, signerPublicKey.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PodEntity')
          ..add('entries', entries)
          ..add('signature', signature)
          ..add('signerPublicKey', signerPublicKey))
        .toString();
  }
}

class PodEntityBuilder implements Builder<PodEntity, PodEntityBuilder> {
  _$PodEntity? _$v;

  MapBuilder<String, PodValueEntity>? _entries;
  MapBuilder<String, PodValueEntity> get entries =>
      _$this._entries ??= MapBuilder<String, PodValueEntity>();
  set entries(MapBuilder<String, PodValueEntity>? entries) =>
      _$this._entries = entries;

  String? _signature;
  String? get signature => _$this._signature;
  set signature(String? signature) => _$this._signature = signature;

  String? _signerPublicKey;
  String? get signerPublicKey => _$this._signerPublicKey;
  set signerPublicKey(String? signerPublicKey) =>
      _$this._signerPublicKey = signerPublicKey;

  PodEntityBuilder();

  PodEntityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _entries = $v.entries.toBuilder();
      _signature = $v.signature;
      _signerPublicKey = $v.signerPublicKey;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PodEntity other) {
    _$v = other as _$PodEntity;
  }

  @override
  void update(void Function(PodEntityBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PodEntity build() => _build();

  _$PodEntity _build() {
    _$PodEntity _$result;
    try {
      _$result = _$v ??
          _$PodEntity._(
            entries: entries.build(),
            signature: BuiltValueNullFieldError.checkNotNull(
                signature, r'PodEntity', 'signature'),
            signerPublicKey: BuiltValueNullFieldError.checkNotNull(
                signerPublicKey, r'PodEntity', 'signerPublicKey'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'entries';
        entries.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'PodEntity', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
