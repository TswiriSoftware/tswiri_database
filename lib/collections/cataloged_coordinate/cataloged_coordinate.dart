import 'package:isar/isar.dart';
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
  int id = Isar.autoIncrement;

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
  @Vector3Converter()
  late vm.Vector3? coordinate;

  ///The rotation of this barcode.
  @Name("rotation")
  @Vector3Converter()
  late vm.Vector3? rotation;

  @override
  String toString() {
    return '\ngridUID: $gridUID, barcodeUID: $barcodeUID, coordinate; $coordinate, timestamp: $timestamp';
  }

  List<dynamic> toMessage() {
    return [
      'update', //[0]
      barcodeUID, //[1]
      gridUID, //[2]
      timestamp, //[3]
      [
        coordinate!.x, // [4][0]
        coordinate!.y, // [4][1]
        coordinate!.z, // [4][2]
      ],
    ];
  }
}

CatalogedCoordinate catalogedCoordinateFromMessage(List<dynamic> message) {
  return CatalogedCoordinate()
    ..barcodeUID = message[1]
    ..coordinate = vm.Vector3(
      message[4][0] as double,
      message[4][1] as double,
      message[4][2] as double,
    )
    ..gridUID = message[2] as int
    ..timestamp = message[3] as int
    ..rotation = null;
}

class Vector3Converter extends TypeConverter<vm.Vector3?, List<double>?> {
  const Vector3Converter(); // Converters need to have an empty const constructor

  @override
  vm.Vector3? fromIsar(List<double>? object) {
    if (object != null) {
      return vm.Vector3(object[0], object[1], object[2]);
    }
    return null;
  }

  @override
  List<double>? toIsar(vm.Vector3? object) {
    if (object != null) {
      return [
        object.x,
        object.y,
        object.z,
      ];
    }
    return null;
  }
}
