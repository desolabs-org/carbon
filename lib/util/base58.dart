import 'package:fast_base58/fast_base58.dart';

String Base58ToString(List<int>? signedBytes) {
  if (signedBytes == null) return "";
  else {
    List<int> bytes = signedBytes.map((e) => e.toUnsigned(8) ).toList(growable: false);
    return Base58Encode(bytes);
  }
}