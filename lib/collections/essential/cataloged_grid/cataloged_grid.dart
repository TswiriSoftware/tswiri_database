import 'package:isar/isar.dart';
part 'cataloged_grid.g.dart';

///[CatalogedGrid]
///
///  - `id` the id of `this`.
///  - `barcodeUID` BarcodeUID of `this` origin's barcode.
///  - `parentBarcodeUID` The parent container's UID of `this`.
///
@Collection()
@Name("CatalogedGrid")
class CatalogedGrid {
  Id id = Isar.autoIncrement;

  ///BarcodeUID of the origin barcode.
  @Name("barcodeUID")
  late String barcodeUID;

  ///The parent container's UID of this grid.
  @Name("parentBarcodeUID")
  late String? parentBarcodeUID;

  @override
  String toString() {
    return '\nbarcodeUID: $barcodeUID, parentBarcodeUID: $parentBarcodeUID';
  }

  //To json.
  Map toJson() => {
        'id': id,
        'barcodeUID': barcodeUID,
        'parentBarcodeUID': parentBarcodeUID,
      };

  //From json
  CatalogedGrid fromJson(Map<String, dynamic> json) {
    return CatalogedGrid()
      ..id = json['id']
      ..barcodeUID = json['barcodeUID']
      ..parentBarcodeUID = json['parentBarcodeUID'];
  }
}
