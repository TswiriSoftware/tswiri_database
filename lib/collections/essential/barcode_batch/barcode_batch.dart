import 'package:isar/isar.dart';
import 'package:tswiri_database/variables.dart';
part 'barcode_batch.g.dart';

///[BarcodeBatch]
///
/// - `uid` uid of `this`.
/// - `id` the id of `this`.
/// - `timestamp` Time of `this`creation.
/// - `width`  Width of `this`. (mm)
/// - `height` Height of `this`. (mm)
///
@Collection()
@Name("BarcodeBatch")
class BarcodeBatch {
  Id id = Isar.autoIncrement;

  ///uid of `this`.
  @Name('uid')
  @Index(unique: true)
  late String uid = '${isarDeviceID}_$id';

  ///Time of `this`creation.
  @Name("timestamp")
  late int timestamp;

  ///Width of `this`. (mm)
  @Name("width")
  late double width;

  ///Height of `this`. (mm)
  @Name("height")
  late double height;

  @override
  String toString() {
    return '\ntimestamp: $timestamp, h: $height, w: $width';
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'uid': uid,
        'timestamp': timestamp,
        'width': width,
        'height': height,
      };

  BarcodeBatch fromJson(Map<String, dynamic> json) {
    return BarcodeBatch()
      ..id = json['id']
      ..uid = json['uid']
      ..timestamp = json['timestamp'] as int
      ..width = json['width'] as double
      ..height = json['height'] as double;
  }
}
