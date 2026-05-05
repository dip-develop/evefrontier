import 'dart:convert';
import 'package:web3dart/web3dart.dart';

import '../models/models.dart';


/// EIP-191 personal_sign
Future<String> signPersonalMessage(EthPrivateKey creds, String message) async {
  final prefix = '\u0019Ethereum Signed Message:\n${message.length}';
  final msgBytes = utf8.encode(prefix + message);
  final hash = keccak256(msgBytes);
  final sig = creds.signPersonalMessageToUint8List(msgBytes);
  return bytesToHex(sig, include0x: true);
}

/// Восстановление адреса из подписи
Future<EthereumAddress> recoverAddress(String signature, String message) async {
  final prefix = '\u0019Ethereum Signed Message:\n${message.length}';
  final msgBytes = utf8.encode(prefix + message);
  final hash = keccak256(msgBytes);
  final sig = hexToBytes(signature);
  final r = sig.sublist(0, 32);
  final s = sig.sublist(32, 64);
  final v = sig[64];
  final pub = ecRecover(
      hash,
      MsgSignature(
        bytesToInt(r),
        bytesToInt(s),
        v,
      ));
  return EthereumAddress((p0) => p0..hex = pub);
}
