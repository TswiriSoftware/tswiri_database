import 'package:isar/isar.dart';
import 'package:tswiri_database/src/collections/essential/cataloged_container/cataloged_container.dart';
part 'marker.g.dart';

///[Marker]
///
///  - `id` the id of `this`.
///  - `containerUID` The [CatalogedContainer]'s UID of `this`.
///  - `barcodeUID` The barcodeUID of `this`.
///
@Collection()
@Name("Marker")
class Marker {
  Id id = Isar.autoIncrement;

  @Name('uid')
  @Index(unique: true)
  late String uid;

  @Name("containerUID")
  late String? containerUID;

  @Name("barcodeUID")
  late String barcodeUID;

  @override
  String toString() {
    return '\nparentContainerUID: $containerUID, barcodeUID: $barcodeUID';
  }

  ///To json.
  Map toJson() => {
        'id': id,
        'uid': uid,
        'containerUID': containerUID,
        'barcodeUID': barcodeUID,
      };

  ///From json.
  Marker fromJson(Map<String, dynamic> json) {
    return Marker()
      ..id = json['id']
      ..uid = json['uid']
      ..containerUID = json['containerUID']
      ..barcodeUID = json['barcodeUID'];
  }
}
