import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'auth_result.g.dart';

abstract class AuthResult implements Built<AuthResult, AuthResultBuilder> {
  static Serializer<AuthResult> get serializer => _$authResultSerializer;

  String get address;
  String get signature;
  String get token;

  AuthResult._();
  factory AuthResult([void Function(AuthResultBuilder) updates]) = _$AuthResult;
}
