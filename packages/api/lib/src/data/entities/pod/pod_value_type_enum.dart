import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'pod_value_type_enum.g.dart';

/// This class represents a smart assembly entity, which includes various properties
class PodValueTypeEnum extends EnumClass {
  static Serializer<PodValueTypeEnum> get serializer =>
      _$podValueTypeEnumSerializer;

  static const PodValueTypeEnum string = _$string;
  static const PodValueTypeEnum bytes = _$bytes;
  static const PodValueTypeEnum cryptographic = _$cryptographic;
  static const PodValueTypeEnum int = _$int;
  static const PodValueTypeEnum boolean = _$boolean;
  @BuiltValueEnumConst(wireName: 'eddsa_pubkey')
  static const PodValueTypeEnum eddsaPubKey = _$eddsaPubKey;
  static const PodValueTypeEnum date = _$date;
  static const PodValueTypeEnum array = _$array;
  static const PodValueTypeEnum map = _$map;

  const PodValueTypeEnum._(super.name);

  static BuiltSet<PodValueTypeEnum> get values => _$values;
  static PodValueTypeEnum valueOf(String name) => _$valueOf(name);
}
