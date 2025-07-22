// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_data_entity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginationDataEntity<T> extends PaginationDataEntity<T> {
  @override
  final BuiltList<T> data;
  @override
  final PaginationMetadataEntry metadata;

  factory _$PaginationDataEntity(
          [void Function(PaginationDataEntityBuilder<T>)? updates]) =>
      (PaginationDataEntityBuilder<T>()..update(updates))._build();

  _$PaginationDataEntity._({required this.data, required this.metadata})
      : super._();
  @override
  PaginationDataEntity<T> rebuild(
          void Function(PaginationDataEntityBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaginationDataEntityBuilder<T> toBuilder() =>
      PaginationDataEntityBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginationDataEntity &&
        data == other.data &&
        metadata == other.metadata;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, metadata.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PaginationDataEntity')
          ..add('data', data)
          ..add('metadata', metadata))
        .toString();
  }
}

class PaginationDataEntityBuilder<T>
    implements
        Builder<PaginationDataEntity<T>, PaginationDataEntityBuilder<T>> {
  _$PaginationDataEntity<T>? _$v;

  ListBuilder<T>? _data;
  ListBuilder<T> get data => _$this._data ??= ListBuilder<T>();
  set data(ListBuilder<T>? data) => _$this._data = data;

  PaginationMetadataEntryBuilder? _metadata;
  PaginationMetadataEntryBuilder get metadata =>
      _$this._metadata ??= PaginationMetadataEntryBuilder();
  set metadata(PaginationMetadataEntryBuilder? metadata) =>
      _$this._metadata = metadata;

  PaginationDataEntityBuilder();

  PaginationDataEntityBuilder<T> get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _metadata = $v.metadata.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginationDataEntity<T> other) {
    _$v = other as _$PaginationDataEntity<T>;
  }

  @override
  void update(void Function(PaginationDataEntityBuilder<T>)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginationDataEntity<T> build() => _build();

  _$PaginationDataEntity<T> _build() {
    _$PaginationDataEntity<T> _$result;
    try {
      _$result = _$v ??
          _$PaginationDataEntity<T>._(
            data: data.build(),
            metadata: metadata.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
        _$failedField = 'metadata';
        metadata.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'PaginationDataEntity', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
