part of tswiri_database;

///default: Returns a list of all [CatalogedBarcode].
///
///batchID: Returns a list of [CatalogedBarcode] matching batchID.
///
List<CatalogedBarcode> getCatalogedBarcodesSync({
  int? batchID,
}) {
  if (batchID != null) {
    return _isar!.catalogedBarcodes
        .filter()
        .batchIDEqualTo(batchID)
        .findAllSync();
  }
  return _isar!.catalogedBarcodes.where().findAllSync();
}

///default: Returns null
///
///id: [CatalogedBarcode] mathcing the ID
///
///barcodeUID: [CatalogedBarcode] matching the BarcodeUID
///
CatalogedBarcode? getCatalogedBarcodeSync({
  int? id,
  String? barcodeUID,
}) {
  if (id != null) {
    return _isar!.catalogedBarcodes.filter().idEqualTo(id).findFirstSync();
  }
  if (barcodeUID != null) {
    return _isar!.catalogedBarcodes
        .filter()
        .barcodeUIDEqualTo(barcodeUID)
        .findFirstSync();
  }
  return null;
}
