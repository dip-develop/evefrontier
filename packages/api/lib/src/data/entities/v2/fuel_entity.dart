import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../entities.dart';

part 'fuel_entity.g.dart';

/// This class represents a fuel entity in the game EVE Frontier.
abstract class FuelEntity implements Built<FuelEntity, FuelEntityBuilder> {
  static Serializer<FuelEntity> get serializer => _$fuelEntitySerializer;

  int get efficiency;
  TypeEntity get type;

  FuelEntity._();
  factory FuelEntity([void Function(FuelEntityBuilder) updates]) = _$FuelEntity;
}
