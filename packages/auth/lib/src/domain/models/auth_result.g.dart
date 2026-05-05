// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_result.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AuthResult> _$authResultSerializer = _$AuthResultSerializer();

class _$AuthResultSerializer implements StructuredSerializer<AuthResult> {
  @override
  final Iterable<Type> types = const [AuthResult, _$AuthResult];
  @override
  final String wireName = 'AuthResult';

  @override
  Iterable<Object?> serialize(Serializers serializers, AuthResult object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(String)),
      'signature',
      serializers.serialize(object.signature,
          specifiedType: const FullType(String)),
      'token',
      serializers.serialize(object.token,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  AuthResult deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = AuthResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'signature':
          result.signature = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AuthResult extends AuthResult {
  @override
  final String address;
  @override
  final String signature;
  @override
  final String token;

  factory _$AuthResult([void Function(AuthResultBuilder)? updates]) =>
      (AuthResultBuilder()..update(updates))._build();

  _$AuthResult._(
      {required this.address, required this.signature, required this.token})
      : super._();
  @override
  AuthResult rebuild(void Function(AuthResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthResultBuilder toBuilder() => AuthResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthResult &&
        address == other.address &&
        signature == other.signature &&
        token == other.token;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, signature.hashCode);
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AuthResult')
          ..add('address', address)
          ..add('signature', signature)
          ..add('token', token))
        .toString();
  }
}

class AuthResultBuilder implements Builder<AuthResult, AuthResultBuilder> {
  _$AuthResult? _$v;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _signature;
  String? get signature => _$this._signature;
  set signature(String? signature) => _$this._signature = signature;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  AuthResultBuilder();

  AuthResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _address = $v.address;
      _signature = $v.signature;
      _token = $v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthResult other) {
    _$v = other as _$AuthResult;
  }

  @override
  void update(void Function(AuthResultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthResult build() => _build();

  _$AuthResult _build() {
    final _$result = _$v ??
        _$AuthResult._(
          address: BuiltValueNullFieldError.checkNotNull(
              address, r'AuthResult', 'address'),
          signature: BuiltValueNullFieldError.checkNotNull(
              signature, r'AuthResult', 'signature'),
          token: BuiltValueNullFieldError.checkNotNull(
              token, r'AuthResult', 'token'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
