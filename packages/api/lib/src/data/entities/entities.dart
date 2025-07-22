import 'package:built_collection/built_collection.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/iso_8601_duration_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'models/address_config_entity.dart';
import 'models/chain_config_entity.dart';
import 'v2/smart_assembly_state_enum.dart';
import 'v2/smart_character_entity.dart';
import 'models/contracts_entity.dart';
import 'models/item_type_ids_entity.dart';
import 'v2/kill_mail_entity.dart';
import 'models/loss_type_enum.dart';
import 'models/native_currency_entity.dart';
import 'models/rpc_entity.dart';
import 'models/rpc_urls_entity.dart';
import 'models/system_ids_entity.dart';
import 'pod/pod_entry.dart';
import 'pod/pod_value_entry.dart';
import 'pod/pod_value_type_enum.dart';
import 'routes/abi_cfg_entity.dart';
import 'routes/abi_config_entity.dart';
import 'routes/abi_entity.dart';
import 'routes/eip_entity.dart';
import 'v1/erc_entity.dart';
import 'routes/healthy_entity.dart';
import 'routes/urls_entity.dart';
import 'types/all_types_data_entity.dart';
import 'types/attribute_entity.dart';
import 'types/ephemeral_inventory_entity.dart';
import 'types/fuel_module_entity.dart';
import 'types/gate_link_module_entity.dart';
import 'types/inventory_item_entity.dart';
import 'types/inventory_module_entity.dart';
import 'v2/location_entity.dart';
import 'types/metadata_entity.dart';
import 'types/proximity_module_entity.dart';
import 'v2/smart_assembly_entity.dart';
import 'v2/smart_assembly_type_enum.dart';
/* import 'types/smart_character_entity.dart'; */
import 'v2/solar_system_entity.dart';
import 'types/static_data_entity.dart';
import 'v2/pagination_data_entity.dart';
import 'v2/pagination_metadata_entry.dart';
import 'v2/type_entity.dart';
import 'v2/verify_response_entry.dart';

export 'models/address_config_entity.dart';
export 'models/chain_config_entity.dart';
export 'v2/smart_character_entity.dart';
export 'models/contracts_entity.dart';
export 'models/item_type_ids_entity.dart';

export 'models/loss_type_enum.dart';
export 'models/native_currency_entity.dart';
export 'models/rpc_entity.dart';
export 'models/rpc_urls_entity.dart';
export 'models/system_ids_entity.dart';
export 'routes/abi_cfg_entity.dart';
export 'routes/abi_config_entity.dart';
export 'routes/abi_entity.dart';
export 'routes/eip_entity.dart';

export 'routes/healthy_entity.dart';
export 'routes/urls_entity.dart';
export 'types/all_types_data_entity.dart';
export 'types/attribute_entity.dart';
export 'types/ephemeral_inventory_entity.dart';
export 'types/fuel_module_entity.dart';
export 'types/gate_link_module_entity.dart';
export 'types/inventory_item_entity.dart';
export 'types/inventory_module_entity.dart';
export 'v2/location_entity.dart';
export 'types/metadata_entity.dart';
export 'types/proximity_module_entity.dart';
export 'v2/smart_assembly_entity.dart';
export 'v2/smart_assembly_type_enum.dart';
export 'v2/solar_system_entity.dart';
export 'types/static_data_entity.dart';
export 'pod/pod_entry.dart';
export 'pod/pod_value_entry.dart';
export 'pod/pod_value_type_enum.dart';

export 'v1/erc_entity.dart';

export 'v2/kill_mail_entity.dart';
export 'v2/verify_response_entry.dart';
export 'v2/pagination_metadata_entry.dart';
export 'v2/pagination_data_entity.dart';
export 'v2/smart_assembly_state_enum.dart';
export 'v2/type_entity.dart';

part 'entities.g.dart';

@SerializersFor([
  AddressConfigEntity,
  ChainConfigEntity,
  /* SmartCharacterEntity, */
  ContractsEntity,
  ItemTypeIDsEntity,
  KillMailEntity,
  LossTypeEnum,
  NativeCurrencyEntity,
  RpcEntity,
  RpcUrlsEntity,
  SystemIdsEntity,
  AbiCfgEntity,
  AbiEntity,
  AbiConfigEntity,
  EipEntity,
  ErcEntity,
  HealthyEntity,
  UrlsEntity,
  AllTypesDataEntity,
  AllTypesDataAttributesEntity,
  AttributeEntity,
  AttributePropertiesEntity,
  EphemeralInventoryEntity,
  FuelModuleEntity,
  GateLinkModuleEntity,
  InventoryItemEntity,
  InventoryModuleEntity,
  LocationEntity,
  MetadataEntity,
  ProximityModuleEntity,
  SmartAssemblyEntity,
  SmartAssemblyEntity,
  SmartAssemblyTypeEnum,
  SmartAssemblyStateEnum,
  SmartCharacterEntity,
  SolarSystemEntity,
  StaticDataEntity,
  PodEntity,
  PodValueEntity,
  PodValueTypeEnum,
  VerifyResponseEntry,
  PaginationMetadataEntry,
  TypeEntity,
])

/// This is the main serializer for the entities in the app.
final Serializers entititySerializers = (_$entititySerializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(Iso8601DateTimeSerializer())
      ..add(Iso8601DurationSerializer())
      ..add(PaginationDataEntitySerializer<KillMailEntity>())
      ..add(PaginationDataEntitySerializer<SmartAssemblyEntity>())
      ..add(PaginationDataEntitySerializer<SmartCharacterEntity>()))
    .build();
