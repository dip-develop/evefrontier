import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'pagination_metadata_entry.g.dart';

abstract class PaginationMetadataEntry
    implements Built<PaginationMetadataEntry, PaginationMetadataEntryBuilder> {
  static Serializer<PaginationMetadataEntry> get serializer =>
      _$paginationMetadataEntrySerializer;

  int get limit;
  int get offset;
  int get total;

  PaginationMetadataEntry._();
  factory PaginationMetadataEntry(
          [void Function(PaginationMetadataEntryBuilder) updates]) =
      _$PaginationMetadataEntry;
}
