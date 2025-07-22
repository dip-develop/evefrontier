import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../entities.dart';

part 'pod_entry.g.dart';

/// This class represents the configuration of a POD (Proof of Delivery).
abstract class PodEntity implements Built<PodEntity, PodEntityBuilder> {
  static Serializer<PodEntity> get serializer => _$podEntitySerializer;

  BuiltMap<String, PodValueEntity> get entries;
  String get signature;
  String get signerPublicKey;

  PodEntity._();
  factory PodEntity([void Function(PodEntityBuilder) updates]) = _$PodEntity;
}
