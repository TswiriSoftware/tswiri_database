import 'dart:convert';
import 'dart:math';

String generateDeviceUID() {
  var random = Random.secure();
  var values = List<int>.generate(64, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}
