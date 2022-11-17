part of tswiri_database;

///Updates a [BarcodeBatch] and all related [CatalogedBarcode]'s.
updateBarcodeBatch({
  required Isar isar,
  required BarcodeBatch barcodeBatch,
  required List<CatalogedBarcode> barcodes,
}) {
  _isar!.writeTxnSync(() {
    _isar!.barcodeBatchs.putSync(barcodeBatch);
    _isar!.catalogedBarcodes.putAllSync(barcodes);
  });
}
