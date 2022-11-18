import 'package:tswiri_database/src/collections/export.dart';

///default: Returns a list of all [CatalogedBarcode].
///
///batchID: Returns a list of [CatalogedBarcode] matching batchID.
///
List<CatalogedBarcode> getCatalogedBarcodesSync({
  required Isar isar,
  required String? batchUID,
}) {
  if (batchUID != null) {
    return isar.catalogedBarcodes.filter().uidEqualTo(batchUID).findAllSync();
  }
  return isar.catalogedBarcodes.where().findAllSync();
}

///default: Returns null
///
///id: [CatalogedBarcode] mathcing the ID
///
///barcodeUID: [CatalogedBarcode] matching the BarcodeUID
///
CatalogedBarcode? getCatalogedBarcodeSync({
  required Isar isar,
  required String? uid,
  required String? barcodeUID,
}) {
  if (uid != null) {
    return isar.catalogedBarcodes.filter().uidEqualTo(uid).findFirstSync();
  }
  if (barcodeUID != null) {
    return isar.catalogedBarcodes
        .filter()
        .barcodeUIDEqualTo(barcodeUID)
        .findFirstSync();
  }
  return null;
}
