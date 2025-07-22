import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'type_entity.g.dart';

abstract class TypeEntity implements Built<TypeEntity, TypeEntityBuilder> {
  static Serializer<TypeEntity> get serializer => _$typeEntitySerializer;

  int get categoryId;
  String get categoryName;
  String get description;

  int get groupId;
  String get groupName;
  String get iconUrl;

  int get id;
  double get mass;
  String get name;

  int get portionSize;
  double get radius;
  double get volume;

  TypeEntity._();
  factory TypeEntity([void Function(TypeEntityBuilder) updates]) = _$TypeEntity;
}
