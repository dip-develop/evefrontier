// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ethereum_address.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EthereumAddress extends EthereumAddress {
  @override
  final Uint8List hex;

  factory _$EthereumAddress([void Function(EthereumAddressBuilder)? updates]) =>
      (EthereumAddressBuilder()..update(updates))._build();

  _$EthereumAddress._({required this.hex}) : super._();
  @override
  EthereumAddress rebuild(void Function(EthereumAddressBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EthereumAddressBuilder toBuilder() => EthereumAddressBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EthereumAddress && hex == other.hex;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, hex.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EthereumAddress')..add('hex', hex))
        .toString();
  }
}

class EthereumAddressBuilder
    implements Builder<EthereumAddress, EthereumAddressBuilder> {
  _$EthereumAddress? _$v;

  Uint8List? _hex;
  Uint8List? get hex => _$this._hex;
  set hex(Uint8List? hex) => _$this._hex = hex;

  EthereumAddressBuilder();

  EthereumAddressBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _hex = $v.hex;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EthereumAddress other) {
    _$v = other as _$EthereumAddress;
  }

  @override
  void update(void Function(EthereumAddressBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EthereumAddress build() => _build();

  _$EthereumAddress _build() {
    final _$result = _$v ??
        _$EthereumAddress._(
          hex: BuiltValueNullFieldError.checkNotNull(
              hex, r'EthereumAddress', 'hex'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
