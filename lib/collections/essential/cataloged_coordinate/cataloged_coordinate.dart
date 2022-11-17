import 'package:isar/isar.dart';
import 'package:tswiri_database/embedded/embedded_vector_3/embedded_vector_3.dart';
part 'cataloged_coordinate.g.dart';

///[CatalogedCoordinate]
///
///  - `id` the id of `this`.
///  - `barcodeUID` BarcodeUID of `this`.
///  - `gridUID` The GridUID of `this`.
///  - `timestamp` Time of `this` creation.
///  - `coordinate` The vector3 coordinate of `this`.
///  - `rotation` The rotation of `this`.
///
@Collection()
@Name("CatalogedCoordinate")
class CatalogedCoordinate {
  Id id = Isar.autoIncrement;

  @Name('uid')
  @Index(unique: true)
  late String uid;

  @Name("barcodeUID")
  late String barcodeUID;

  @Name("gridUID")
  late String gridUID;

  @Name("timestamp")
  late int timestamp;

  @Name("coordinate")
  late EmbeddedVector3? coordinate;

  @Name("rotation")
  late EmbeddedVector3? rotation;

  @override
  String toString() {
    return '\ngridUID: $gridUID, barcodeUID: $barcodeUID, coordinate; $coordinate, timestamp: $timestamp';
  }

  ///To json.
  Map toJson() => {
        'id': id,
        'uid': uid,
        'barcodeUID': barcodeUID,
        'gridUID': gridUID,
        'timestamp': timestamp,
        'coordinate': [
          coordinate!.vector.x, // [4][0]
          coordinate!.vector.y, // [4][1]
          coordinate!.vector.z, // [4][2]
        ],
        'rotation': [
          rotation?.vector.x, // [4][0]
          rotation?.vector.y, // [4][1]
          rotation?.vector.z, // [4][2]
        ],
      };

  ///From json.
  CatalogedCoordinate fromJson(Map<String, dynamic> json) {
    List<double> coordinateMessage =
        (json['coordinate'] as List<dynamic>).cast<double>();
    List<double?> rotations =
        (json['coordinate'] as List<dynamic>).cast<double?>();

    EmbeddedVector3? decodedRotation;
    if (rotations[0] != null && rotations[1] != null && rotations[2] != null) {
      decodedRotation = EmbeddedVector3.fromMessage(
          [rotations[0]!, rotations[1]!, rotations[2]!]);
    }

    return CatalogedCoordinate()
      ..id = json['id']
      ..uid = json['uid']
      ..barcodeUID = json['barcodeUID']
      ..gridUID = json['gridUID']
      ..timestamp = json['timestamp']
      ..coordinate = EmbeddedVector3.fromMessage(coordinateMessage)
      ..rotation = decodedRotation;
  }

  List<dynamic> toMessage() {
    return [
      'update', //[0]
      barcodeUID, //[1]
      gridUID, //[2]
      timestamp, //[3]
      coordinate!.data, //[4]
    ];
  }
}

CatalogedCoordinate catalogedCoordinateFromMessage(List<dynamic> message) {
  EmbeddedVector3 coordinate = EmbeddedVector3.fromMessage(message[4]);
  return CatalogedCoordinate()
    ..barcodeUID = message[1]
    ..coordinate = coordinate
    ..gridUID = message[2] as String
    ..timestamp = message[3] as int
    ..rotation = null;
}
