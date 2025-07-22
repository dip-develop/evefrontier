import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'verify_response_entry.g.dart';

abstract class VerifyResponseEntry
    implements Built<VerifyResponseEntry, VerifyResponseEntryBuilder> {
  static Serializer<VerifyResponseEntry> get serializer =>
      _$verifyResponseEntrySerializer;

  String get error;
  bool get isValid;

  VerifyResponseEntry._();
  factory VerifyResponseEntry(
          [void Function(VerifyResponseEntryBuilder) updates]) =
      _$VerifyResponseEntry;
}
