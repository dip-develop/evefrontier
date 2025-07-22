import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'healthy_entity.g.dart';

/// This class represents a healthy entity, which is a simple boolean value indicating
abstract class HealthyEntity
    implements Built<HealthyEntity, HealthyEntityBuilder> {
  static Serializer<HealthyEntity> get serializer => _$healthyEntitySerializer;

  bool get ok;

  HealthyEntity._();
  factory HealthyEntity([void Function(HealthyEntityBuilder) updates]) =
      _$HealthyEntity;
}
