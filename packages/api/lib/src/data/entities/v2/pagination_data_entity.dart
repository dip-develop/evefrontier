import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../entities.dart';

part 'pagination_data_entity.g.dart';

/// This class represents a pagination data entity in the game EVE Frontier.
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
  String get wireName => 'PaginationDataEntity<${_getTypeName()}>';

  @override
  final Iterable<Type> types = [
    PaginationDataEntity<T>,
    _$PaginationDataEntity<T>
  ];

  String _getTypeName() {
    if (T == SmartCharacterEntity) return 'SmartCharacterEntity';
    if (T == SmartAssemblyEntity) return 'SmartAssemblyEntity';
    if (T == KillMailEntity) return 'KillMailEntity';
    if (T == TypeEntity) return 'TypeEntity';
    if (T == SolarSystemEntity) return 'SolarSystemEntity';
    if (T == FuelEntity) return 'FuelEntity';
    if (T == ScanEntity) return 'ScanEntity';
    if (T == JumpEntity) return 'JumpEntity';
    return T.toString();
  }

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
    } else if (data is TypeEntity) {
      return serializers.serializeWith(TypeEntity.serializer, data);
    } else if (data is SolarSystemEntity) {
      return serializers.serializeWith(SolarSystemEntity.serializer, data);
    } else if (data is FuelEntity) {
      return serializers.serializeWith(FuelEntity.serializer, data);
    } else if (data is ScanEntity) {
      return serializers.serializeWith(ScanEntity.serializer, data);
    } else if (data is JumpEntity) {
      return serializers.serializeWith(JumpEntity.serializer, data);
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
          final data = serializers.deserializeWith(
              SmartCharacterEntity.serializer, item);
          if (data != null) {
            deserializedItem = data as T;
          }
        } catch (_) {
          try {
            final data = serializers.deserializeWith(
                SmartAssemblyEntity.serializer, item);
            if (data != null) {
              deserializedItem = data as T;
            }
          } catch (_) {
            try {
              final data =
                  serializers.deserializeWith(KillMailEntity.serializer, item);
              if (data != null) {
                deserializedItem = data as T;
              }
            } catch (_) {
              try {
                final data =
                    serializers.deserializeWith(TypeEntity.serializer, item);
                if (data != null) {
                  deserializedItem = data as T;
                }
              } catch (_) {
                try {
                  final data = serializers.deserializeWith(
                      SolarSystemEntity.serializer, item);
                  if (data != null) {
                    deserializedItem = data as T;
                  }
                } catch (_) {
                  try {
                    final data = serializers.deserializeWith(
                        FuelEntity.serializer, item);
                    if (data != null) {
                      deserializedItem = data as T;
                    }
                  } catch (_) {
                    try {
                      final data = serializers.deserializeWith(
                          ScanEntity.serializer, item);
                      if (data != null) {
                        deserializedItem = data as T;
                      }
                    } catch (_) {
                      try {
                        final data = serializers.deserializeWith(
                            JumpEntity.serializer, item);
                        if (data != null) {
                          deserializedItem = data as T;
                        }
                      } catch (_) {
                        throw UnsupportedError(
                            'Cannot determine data type from: $value');
                      }
                    }
                  }
                }
              }
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
