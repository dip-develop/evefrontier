// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pod_value_entry.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PodValueEntity> _$podValueEntitySerializer =
    _$PodValueEntitySerializer();

class _$PodValueEntitySerializer
    implements StructuredSerializer<PodValueEntity> {
  @override
  final Iterable<Type> types = const [PodValueEntity, _$PodValueEntity];
  @override
  final String wireName = 'PodValueEntity';

  @override
  Iterable<Object?> serialize(Serializers serializers, PodValueEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'valueType',
      serializers.serialize(object.valueType,
          specifiedType: const FullType(PodValueTypeEnum)),
    ];
    Object? value;
    value = object.bigVal;
    if (value != null) {
      result
        ..add('bigVal')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.boolVal;
    if (value != null) {
      result
        ..add('boolVal')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.bytesVal;
    if (value != null) {
      result
        ..add('bytesVal')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.stringVal;
    if (value != null) {
      result
        ..add('stringVal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.timeVal;
    if (value != null) {
      result
        ..add('timeVal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    return result;
  }

  @override
  PodValueEntity deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = PodValueEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'bigVal':
          result.bigVal = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'boolVal':
          result.boolVal = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'bytesVal':
          result.bytesVal.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'stringVal':
          result.stringVal = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'timeVal':
          result.timeVal = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'valueType':
          result.valueType = serializers.deserialize(value,
                  specifiedType: const FullType(PodValueTypeEnum))!
              as PodValueTypeEnum;
          break;
      }
    }

    return result.build();
  }
}

class _$PodValueEntity extends PodValueEntity {
  @override
  final int? bigVal;
  @override
  final bool? boolVal;
  @override
  final BuiltList<int>? bytesVal;
  @override
  final String? stringVal;
  @override
  final DateTime? timeVal;
  @override
  final PodValueTypeEnum valueType;

  factory _$PodValueEntity([void Function(PodValueEntityBuilder)? updates]) =>
      (PodValueEntityBuilder()..update(updates))._build();

  _$PodValueEntity._(
      {this.bigVal,
      this.boolVal,
      this.bytesVal,
      this.stringVal,
      this.timeVal,
      required this.valueType})
      : super._();
  @override
  PodValueEntity rebuild(void Function(PodValueEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PodValueEntityBuilder toBuilder() => PodValueEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PodValueEntity &&
        bigVal == other.bigVal &&
        boolVal == other.boolVal &&
        bytesVal == other.bytesVal &&
        stringVal == other.stringVal &&
        timeVal == other.timeVal &&
        valueType == other.valueType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, bigVal.hashCode);
    _$hash = $jc(_$hash, boolVal.hashCode);
    _$hash = $jc(_$hash, bytesVal.hashCode);
    _$hash = $jc(_$hash, stringVal.hashCode);
    _$hash = $jc(_$hash, timeVal.hashCode);
    _$hash = $jc(_$hash, valueType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PodValueEntity')
          ..add('bigVal', bigVal)
          ..add('boolVal', boolVal)
          ..add('bytesVal', bytesVal)
          ..add('stringVal', stringVal)
          ..add('timeVal', timeVal)
          ..add('valueType', valueType))
        .toString();
  }
}

class PodValueEntityBuilder
    implements Builder<PodValueEntity, PodValueEntityBuilder> {
  _$PodValueEntity? _$v;

  int? _bigVal;
  int? get bigVal => _$this._bigVal;
  set bigVal(int? bigVal) => _$this._bigVal = bigVal;

  bool? _boolVal;
  bool? get boolVal => _$this._boolVal;
  set boolVal(bool? boolVal) => _$this._boolVal = boolVal;

  ListBuilder<int>? _bytesVal;
  ListBuilder<int> get bytesVal => _$this._bytesVal ??= ListBuilder<int>();
  set bytesVal(ListBuilder<int>? bytesVal) => _$this._bytesVal = bytesVal;

  String? _stringVal;
  String? get stringVal => _$this._stringVal;
  set stringVal(String? stringVal) => _$this._stringVal = stringVal;

  DateTime? _timeVal;
  DateTime? get timeVal => _$this._timeVal;
  set timeVal(DateTime? timeVal) => _$this._timeVal = timeVal;

  PodValueTypeEnum? _valueType;
  PodValueTypeEnum? get valueType => _$this._valueType;
  set valueType(PodValueTypeEnum? valueType) => _$this._valueType = valueType;

  PodValueEntityBuilder();

  PodValueEntityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _bigVal = $v.bigVal;
      _boolVal = $v.boolVal;
      _bytesVal = $v.bytesVal?.toBuilder();
      _stringVal = $v.stringVal;
      _timeVal = $v.timeVal;
      _valueType = $v.valueType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PodValueEntity other) {
    _$v = other as _$PodValueEntity;
  }

  @override
  void update(void Function(PodValueEntityBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PodValueEntity build() => _build();

  _$PodValueEntity _build() {
    _$PodValueEntity _$result;
    try {
      _$result = _$v ??
          _$PodValueEntity._(
            bigVal: bigVal,
            boolVal: boolVal,
            bytesVal: _bytesVal?.build(),
            stringVal: stringVal,
            timeVal: timeVal,
            valueType: BuiltValueNullFieldError.checkNotNull(
                valueType, r'PodValueEntity', 'valueType'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'bytesVal';
        _bytesVal?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'PodValueEntity', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
