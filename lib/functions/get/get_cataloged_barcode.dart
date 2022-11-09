part of tswiri_database;

///Returns a list of all cataloged barcodes. (sync)
List<CatalogedBarcode> getCatalogedBarcodesSync({
  int? batchID,
}) {
  return _isar!.catalogedBarcodes.where().findAllSync();
}

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
