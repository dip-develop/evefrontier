import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../entities.dart';

part 'pod_value_entry.g.dart';

/// This class represents the configuration of a POD Value (Proof of Delivery Value).
abstract class PodValueEntity
    implements Built<PodValueEntity, PodValueEntityBuilder> {
  static Serializer<PodValueEntity> get serializer =>
      _$podValueEntitySerializer;

  int get bigVal;
  bool get boolVal;
  BuiltList<int> get bytesVal;
  String get stringVal;
  String get timeVal;
  PodValueTypeEnum get valueType;

  PodValueEntity._();
  factory PodValueEntity([void Function(PodValueEntityBuilder) updates]) =
      _$PodValueEntity;
}
