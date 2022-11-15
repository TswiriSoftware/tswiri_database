import 'package:isar/isar.dart';
part 'barcode_batch.g.dart';

///[BarcodeBatch]
///
///  - `id` the id of `this`.
/// - `timestamp` Time of `this`creation.
/// - `width`  Width of `this`. (mm)
/// - `height` Height of `this`. (mm)
///
@Collection()
@Name("BarcodeBatch")
class BarcodeBatch {
  Id id = Isar.autoIncrement;

  //Generation Time.
  @Name("timestamp")
  late int timestamp;

  ///Width (mm).
  @Name("width")
  late double width;

  ///Height (mm).
  @Name("height")
  late double height;

  @override
  String toString() {
    return '\ntimestamp: $timestamp, h: $height, w: $width';
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'timestamp': timestamp,
        'width': width,
        'height': height,
      };

  BarcodeBatch fromJson(Map<String, dynamic> json) {
    return BarcodeBatch()
      ..id = json['id']
      ..timestamp = json['timestamp'] as int
      ..width = json['width'] as double
      ..height = json['height'] as double;
  }
}
