import 'dart:convert';
import 'package:pointycastle/digests/sha256.dart';

class ServiceHash {
  static String hashData(String data) {
    var digest = SHA256Digest();
    return digest.process(utf8.encode(data)).map((byte) => byte.toRadixString(16).padLeft(2, '0')).join('');
  }
}
