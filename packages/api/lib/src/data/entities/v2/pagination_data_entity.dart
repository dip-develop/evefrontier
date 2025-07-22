import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../entities.dart';

part 'pagination_data_entity.g.dart';

/// This class represents a kill mail entity in the game EVE Frontier.
abstract class PaginationDataEntity<T>
    implements Built<PaginationDataEntity<T>, PaginationDataEntityBuilder<T>> {
  BuiltList<T> get data;
  PaginationMetadataEntry get metadata;

  PaginationDataEntity._();
  factory PaginationDataEntity(
          [void Function(PaginationDataEntityBuilder<T>) updates]) =
      _$PaginationDataEntity<T>;

  @BuiltValueSerializer(custom: true)
  Serializer<PaginationDataEntity<T>> get serializer =>
      PaginationDataEntitySerializer<T>();
}

class PaginationDataEntitySerializer<T>
    implements StructuredSerializer<PaginationDataEntity<T>> {
  @override
  final Iterable<Type> types = const [
    PaginationDataEntity,
    _$PaginationDataEntity
  ];

  @override
  final String wireName = T.toString();

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PaginationDataEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    return [
      'data',
      _serializeData(serializers, object.data),
      'metadata',
      serializers.serialize(object.metadata,
          specifiedType: const FullType(PaginationMetadataEntry)),
    ];
  }

  @override
  PaginationDataEntity<T> deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = PaginationDataEntityBuilder<T>();
    final iterator = serialized.iterator;

    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;

      switch (key) {
        case 'data':
          result.data = _deserializeData(serializers, value)?.toBuilder();
          break;
        case 'metadata':
          result.metadata.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PaginationMetadataEntry))
              as PaginationMetadataEntry);
          break;
      }
    }
    return result.build();
  }

  Object? _serializeData(Serializers serializers, Object? data) {
    if (data is SmartCharacterEntity) {
      return serializers.serializeWith(SmartCharacterEntity.serializer, data);
    } else if (data is SmartAssemblyEntity) {
      return serializers.serializeWith(SmartAssemblyEntity.serializer, data);
    } else if (data is KillMailEntity) {
      return serializers.serializeWith(KillMailEntity.serializer, data);
    } else {
      throw UnsupportedError('Unsupported data type: ${data.runtimeType}');
    }
  }

  BuiltList<T>? _deserializeData(Serializers serializers, Object? value) {
    if (value is! List) {
      throw UnsupportedError('Expected List but got: ${value.runtimeType}');
    }

    final items = List<T>.empty(growable: true);

    for (final item in value) {
      if (item is Map) {
        T? deserializedItem;

        try {
          final character = serializers.deserializeWith(
              SmartCharacterEntity.serializer, item);
          if (character != null) {
            deserializedItem = character as T;
          }
        } catch (_) {
          try {
            final assembly = serializers.deserializeWith(
                SmartAssemblyEntity.serializer, item);
            if (assembly != null) {
              deserializedItem = assembly as T;
            }
          } catch (_) {
            try {
              final killMail =
                  serializers.deserializeWith(KillMailEntity.serializer, item);
              if (killMail != null) {
                deserializedItem = killMail as T;
              }
            } catch (_) {
              throw UnsupportedError('Cannot determine data type from: $value');
            }
          }
        }

        if (deserializedItem != null) {
          items.add(deserializedItem);
        }
      }
    }

    return BuiltList<T>(items);
  }
}
