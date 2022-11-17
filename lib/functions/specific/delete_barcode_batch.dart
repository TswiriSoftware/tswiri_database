part of tswiri_database;

//Delete a barcodeBatch Identified by ID.
// - This deletes not only the Barcode Batch but ALSO all related CatalogedBarcodes.
deleteBarcodeBatch({
  required Isar isar,
  required String uid,
}) {
  _isar!.writeTxnSync(() {
    _isar!.barcodeBatchs.filter().uidEqualTo(uid).deleteFirstSync();
    _isar!.catalogedBarcodes.filter().batchUIDEqualTo(uid).deleteAllSync();
  });
}
