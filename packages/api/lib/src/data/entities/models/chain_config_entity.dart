import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../entities.dart';

part 'chain_config_entity.g.dart';

// / This class represents the configuration for a blockchain network.
abstract class ChainConfigEntity
    implements Built<ChainConfigEntity, ChainConfigEntityBuilder> {
  static Serializer<ChainConfigEntity> get serializer =>
      _$chainConfigEntitySerializer;

  String get baseDappUrl;
  String get blockExplorerUrl;
  int get chainId;
  ContractsEntity get contracts;
  String get indexerUrl;
  String get ipfsApiUrl;
  ItemTypeIDsEntity get itemTypeIDs;
  String get metadataApiUrl;
  String get name;
  NativeCurrencyEntity get nativeCurrency;
  RpcEntity get rpcUrls;
  SystemIdsEntity get systems;
  String get vaultDappUrl;
  String get walletApiUrl;

  ChainConfigEntity._();
  factory ChainConfigEntity([void Function(ChainConfigEntityBuilder) updates]) =
      _$ChainConfigEntity;
}
