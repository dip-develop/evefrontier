// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_response_entry.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VerifyResponseEntry> _$verifyResponseEntrySerializer =
    _$VerifyResponseEntrySerializer();

class _$VerifyResponseEntrySerializer
    implements StructuredSerializer<VerifyResponseEntry> {
  @override
  final Iterable<Type> types = const [
    VerifyResponseEntry,
    _$VerifyResponseEntry
  ];
  @override
  final String wireName = 'VerifyResponseEntry';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, VerifyResponseEntry object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'error',
      serializers.serialize(object.error,
          specifiedType: const FullType(String)),
      'isValid',
      serializers.serialize(object.isValid,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  VerifyResponseEntry deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = VerifyResponseEntryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'error':
          result.error = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'isValid':
          result.isValid = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$VerifyResponseEntry extends VerifyResponseEntry {
  @override
  final String error;
  @override
  final bool isValid;

  factory _$VerifyResponseEntry(
          [void Function(VerifyResponseEntryBuilder)? updates]) =>
      (VerifyResponseEntryBuilder()..update(updates))._build();

  _$VerifyResponseEntry._({required this.error, required this.isValid})
      : super._();
  @override
  VerifyResponseEntry rebuild(
          void Function(VerifyResponseEntryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VerifyResponseEntryBuilder toBuilder() =>
      VerifyResponseEntryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VerifyResponseEntry &&
        error == other.error &&
        isValid == other.isValid;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, isValid.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VerifyResponseEntry')
          ..add('error', error)
          ..add('isValid', isValid))
        .toString();
  }
}

class VerifyResponseEntryBuilder
    implements Builder<VerifyResponseEntry, VerifyResponseEntryBuilder> {
  _$VerifyResponseEntry? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isValid;
  bool? get isValid => _$this._isValid;
  set isValid(bool? isValid) => _$this._isValid = isValid;

  VerifyResponseEntryBuilder();

  VerifyResponseEntryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isValid = $v.isValid;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VerifyResponseEntry other) {
    _$v = other as _$VerifyResponseEntry;
  }

  @override
  void update(void Function(VerifyResponseEntryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VerifyResponseEntry build() => _build();

  _$VerifyResponseEntry _build() {
    final _$result = _$v ??
        _$VerifyResponseEntry._(
          error: BuiltValueNullFieldError.checkNotNull(
              error, r'VerifyResponseEntry', 'error'),
          isValid: BuiltValueNullFieldError.checkNotNull(
              isValid, r'VerifyResponseEntry', 'isValid'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
