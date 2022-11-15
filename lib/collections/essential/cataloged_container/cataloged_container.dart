import 'package:isar/isar.dart';
import 'package:tswiri_database/collections/essential/container_type/container_type.dart';
part 'cataloged_container.g.dart';

///[CatalogedContainer]
///
///  - `id` the id of `this`.
///  - `containerUID` Unique identifier of `this`.
///  - `containerTypeID` The [ContainerType] ID of `this`.
///  - `name` Name of the [CatalogedContainer].
///  - `description` Description of `this`.
///  - `barcodeUID` Barcode linked to `this`.
///
@Collection()
@Name("CatalogedContainer")
class CatalogedContainer {
  Id id = Isar.autoIncrement;

  ///Unique identifier.
  @Name("containerUID")
  @Index(unique: true)
  late String containerUID;

  ///The ID of [ContainerType].
  @Name("containerTypeID")
  late int containerTypeID;

  ///Name of the [CatalogedContainer].
  @Name("name")
  late String? name;

  ///Description of the [CatalogedContainer].
  @Name("description")
  late String? description;

  ///Linked BarcodeUID
  @Name("barcodeUID")
  late String? barcodeUID;

  // @override
  // bool operator ==(Object other) {
  //   return other is CatalogedContainer &&
  //       id == other.id &&
  //       containerType == other.containerType &&
  //       containerUID == other.containerUID &&
  //       name == other.name &&
  //       description == other.description &&
  //       barcodeUID == other.barcodeUID;
  // }

  @override
  String toString() {
    return '\nUID: $containerUID, Type: $containerTypeID, Name: $name, Description: $description, BarcodeUID $barcodeUID';
  }

  //To json.
  Map toJson() => {
        'id': id,
        'containerUID': containerUID,
        'containerTypeID': containerTypeID,
        'name': name,
        'description': description,
        'barcodeUID': barcodeUID,
      };

  //From json
  CatalogedContainer fromJson(Map<String, dynamic> json) {
    return CatalogedContainer()
      ..id = json['id']
      ..containerUID = json['containerUID']
      ..containerTypeID = json['containerTypeID']
      ..name = json['name']
      ..description = json['description']
      ..barcodeUID = json['barcodeUID'];
  }
}
