import 'package:isar/isar.dart';
import 'package:tswiri_database/collections/essential/container_type/container_type.dart';
part 'cataloged_container.g.dart';

///[CatalogedContainer]
///
///  - `uid` uid of `this`.
///  - `id` the id of `this`.
///  - `name` Name of the [CatalogedContainer].
///  - `description` Description of `this`.
///  - `barcodeUID` Barcode linked to `this`.
///  - `containerTypeID` The [ContainerType] ID of `this`.
///
@Collection()
@Name("CatalogedContainer")
class CatalogedContainer {
  Id id = Isar.autoIncrement;

  @Name('uid')
  @Index(unique: true)
  late String uid;

  @Name("name")
  late String? name;

  @Name("description")
  late String? description;

  @Name("barcodeUID")
  late String barcodeUID;

  @Name("containerTypeUID")
  late String containerTypeUID;

  @override
  String toString() {
    return '\nUID: $uid, Type: $containerTypeUID, Name: $name, Description: $description, BarcodeUID $barcodeUID';
  }

  //To json.
  Map toJson() => {
        'id': id,
        'uid': uid,
        'containerTypeID': containerTypeUID,
        'name': name,
        'description': description,
        'barcodeUID': barcodeUID,
      };

  //From json
  CatalogedContainer fromJson(Map<String, dynamic> json) {
    return CatalogedContainer()
      ..id = json['id']
      ..uid = json['uid']
      ..containerTypeUID = json['containerTypeID']
      ..name = json['name']
      ..description = json['description']
      ..barcodeUID = json['barcodeUID'];
  }
}
