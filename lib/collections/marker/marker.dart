import 'package:isar/isar.dart';
part 'marker.g.dart';

//TODO: finish comments.
@Collection()
@Name("Marker")
class Marker {
  Id id = Isar.autoIncrement;

  //Generation Time.
  @Name("containerUID")
  late String? containerUID;

  ///Range Start.
  @Name("barcodeUID")
  late String barcodeUID;

  @override
  String toString() {
    return '\nparentContainerUID: $containerUID, barcodeUID: $barcodeUID';
  }

  ///To json.
  Map toJson() => {
        'id': id,
        'containerUID': containerUID,
        'barcodeUID': barcodeUID,
      };

  ///From json.
  Marker fromJson(Map<String, dynamic> json) {
    return Marker()
      ..id = json['id']
      ..containerUID = json['containerUID']
      ..barcodeUID = json['barcodeUID'];
  }
}
