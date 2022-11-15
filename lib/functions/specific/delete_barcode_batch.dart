part of tswiri_database;

//Delete a barcodeBatch Identified by ID.
// - This deletes not only the Barcode Batch but ALSO all related CatalogedBarcodes.
deleteBarcodeBatch({required int id}) {
  _isar!.writeTxnSync(() {
    _isar!.barcodeBatchs.deleteSync(id);
    _isar!.catalogedBarcodes.filter().batchIDEqualTo(id).deleteAllSync();
  });
}
