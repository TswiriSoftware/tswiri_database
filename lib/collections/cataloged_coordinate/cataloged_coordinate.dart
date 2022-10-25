import 'package:isar/isar.dart';
import 'package:tswiri_database/embedded/embedded_vector_3/embedded_vector_3.dart';
// ignore: depend_on_referenced_packages
import 'package:vector_math/vector_math_64.dart' as vm;
part 'cataloged_coordinate.g.dart';

///TODO: finish commenting.

///Stores details about a container (Created by user).
///
///  - ```containerUID``` Unique identifier.
///  - ```containerTypeID``` Type of container [ContainerType].
///  - ```name``` Name of the container.
///  - ```description``` Description of the container.
///  - ```barcodeUID``` Barcode linked to this container.
///
@Collection()
@Name("CatalogedCoordinate")
class CatalogedCoordinate {
  Id id = Isar.autoIncrement;

  @Name("barcodeUID")
  late String barcodeUID;

  ///The gridUID that this coordinate is a part of.
  @Name("gridUID")
  late int gridUID;

  ///Creation timestamp.
  @Name("timestamp")
  late int timestamp;

  ///The vector3 coordinate.
  @Name("coordinate")
  late EmbeddedVector3? coordinate;

  ///The rotation of this barcode.
  @Name("rotation")
  late EmbeddedVector3? rotation;

  @override
  String toString() {
    return '\ngridUID: $gridUID, barcodeUID: $barcodeUID, coordinate; $coordinate, timestamp: $timestamp';
  }

  ///To json.
  Map toJson() => {
        'id': id,
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

    EmbeddedVector3? decodedRotation = null;
    if (rotations[0] != null && rotations[1] != null && rotations[2] != null) {
      decodedRotation = EmbeddedVector3.fromMessage(
          [rotations[0]!, rotations[1]!, rotations[2]!]);
    }

    return CatalogedCoordinate()
      ..id = json['id']
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
    ..gridUID = message[2] as int
    ..timestamp = message[3] as int
    ..rotation = null;
}

// class Vector3Converter extends TypeConverter<vm.Vector3?, List<double>?> {
//   const Vector3Converter(); // Converters need to have an empty const constructor

//   @override
//   vm.Vector3? fromIsar(List<double>? object) {
//     if (object != null) {
//       return vm.Vector3(object[0], object[1], object[2]);
//     }
//     return null;
//   }

//   @override
//   List<double>? toIsar(vm.Vector3? object) {
//     if (object != null) {
//       return [
//         object.x,
//         object.y,
//         object.z,
//       ];
//     }
//     return null;
//   }
// }
