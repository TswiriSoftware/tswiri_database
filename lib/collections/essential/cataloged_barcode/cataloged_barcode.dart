import 'dart:math';
import 'package:isar/isar.dart';
import 'package:tswiri_database/collections/essential/barcode_batch/barcode_batch.dart';
part 'cataloged_barcode.g.dart';

///[CatalogedBarcode]
///
/// - `uid` uid of `this`.
/// - `id` the id of `this`.
/// - `barcodeUID` [CatalogedBarcode]'s UID `this` is linked to.
/// - `width` Width of `this`. (mm)
/// - `height` Height of `this`. (mm)
/// - `batchID` The [BarcodeBatch]'s UID `this` is linked to.
///
@Collection()
@Name("CatalogedBarcode")
class CatalogedBarcode {
  Id id = Isar.autoIncrement;

  @Name('uid')
  @Index(unique: true)
  late String uid;

  @Name("batchUID")
  late String batchUID;

  @Name("barcodeUID")
  late String barcodeUID;

  @Name("width")
  late double width;

  @Name("height")
  late double height;

  @override
  bool operator ==(Object other) {
    return other is CatalogedBarcode &&
        id == other.id &&
        barcodeUID == other.barcodeUID &&
        height == other.height &&
        width == other.width;
  }

  @override
  String toString() {
    return 'UID: $barcodeUID, h: $height, w: $width mm \n';
  }

  ///To json
  Map toJson() => {
        'id': id,
        'uid': uid,
        'barcodeUID': barcodeUID,
        'height': height,
        'width': width,
      };

  ///From Json
  CatalogedBarcode fromJson(Map<String, dynamic> json) {
    return CatalogedBarcode()
      ..id = json['id']
      ..uid = json['uid']
      ..barcodeUID = json['barcodeUID']
      ..height = json['height'] as double
      ..width = json['width'] as double;
  }

  ///To map
  ///UID : diagonal side length.
  Map<String, double> toMap() => {
        barcodeUID: diagonalSideLength(),
      };

  @override
  int get hashCode => barcodeUID.hashCode;

  double diagonalSideLength() {
    return sqrt((pow(width, 2)) + (pow(height, 2)));
  }
}
