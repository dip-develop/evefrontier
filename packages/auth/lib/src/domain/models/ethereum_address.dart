import 'dart:typed_data';

import 'package:built_value/built_value.dart';

part 'ethereum_address.g.dart';

abstract class EthereumAddress
    implements Built<EthereumAddress, EthereumAddressBuilder> {
  Uint8List get hex;

  factory EthereumAddress([void Function(EthereumAddressBuilder) updates]) =
      _$EthereumAddress;

  EthereumAddress._();
}
