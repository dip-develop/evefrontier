// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_metadata_entry.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PaginationMetadataEntry> _$paginationMetadataEntrySerializer =
    _$PaginationMetadataEntrySerializer();

class _$PaginationMetadataEntrySerializer
    implements StructuredSerializer<PaginationMetadataEntry> {
  @override
  final Iterable<Type> types = const [
    PaginationMetadataEntry,
    _$PaginationMetadataEntry
  ];
  @override
  final String wireName = 'PaginationMetadataEntry';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PaginationMetadataEntry object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'limit',
      serializers.serialize(object.limit, specifiedType: const FullType(int)),
      'offset',
      serializers.serialize(object.offset, specifiedType: const FullType(int)),
      'total',
      serializers.serialize(object.total, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  PaginationMetadataEntry deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = PaginationMetadataEntryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'limit':
          result.limit = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'offset':
          result.offset = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$PaginationMetadataEntry extends PaginationMetadataEntry {
  @override
  final int limit;
  @override
  final int offset;
  @override
  final int total;

  factory _$PaginationMetadataEntry(
          [void Function(PaginationMetadataEntryBuilder)? updates]) =>
      (PaginationMetadataEntryBuilder()..update(updates))._build();

  _$PaginationMetadataEntry._(
      {required this.limit, required this.offset, required this.total})
      : super._();
  @override
  PaginationMetadataEntry rebuild(
          void Function(PaginationMetadataEntryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaginationMetadataEntryBuilder toBuilder() =>
      PaginationMetadataEntryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginationMetadataEntry &&
        limit == other.limit &&
        offset == other.offset &&
        total == other.total;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jc(_$hash, offset.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PaginationMetadataEntry')
          ..add('limit', limit)
          ..add('offset', offset)
          ..add('total', total))
        .toString();
  }
}

class PaginationMetadataEntryBuilder
    implements
        Builder<PaginationMetadataEntry, PaginationMetadataEntryBuilder> {
  _$PaginationMetadataEntry? _$v;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  PaginationMetadataEntryBuilder();

  PaginationMetadataEntryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _limit = $v.limit;
      _offset = $v.offset;
      _total = $v.total;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginationMetadataEntry other) {
    _$v = other as _$PaginationMetadataEntry;
  }

  @override
  void update(void Function(PaginationMetadataEntryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginationMetadataEntry build() => _build();

  _$PaginationMetadataEntry _build() {
    final _$result = _$v ??
        _$PaginationMetadataEntry._(
          limit: BuiltValueNullFieldError.checkNotNull(
              limit, r'PaginationMetadataEntry', 'limit'),
          offset: BuiltValueNullFieldError.checkNotNull(
              offset, r'PaginationMetadataEntry', 'offset'),
          total: BuiltValueNullFieldError.checkNotNull(
              total, r'PaginationMetadataEntry', 'total'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
