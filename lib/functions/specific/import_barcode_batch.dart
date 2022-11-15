part of tswiri_database;

List<CatalogedBarcode> importBarcodeBatch({
  required BarcodeBatch batch,
  required List<String> barcodeUIDs,
}) {
  //TODO: ignore existing barcodes.

  List<CatalogedBarcode> newCatalogedBarcodes = [];
  _isar!.writeTxnSync(() {
    int batchID = _isar!.barcodeBatchs.putSync(batch);

    for (String barcodeUID in barcodeUIDs) {
      newCatalogedBarcodes.add(
        CatalogedBarcode()
          ..barcodeUID = barcodeUID
          ..width = batch.width
          ..height = batch.height
          ..batchID = batchID,
      );
    }

    _isar!.catalogedBarcodes.putAllSync(newCatalogedBarcodes);
  });

  return newCatalogedBarcodes;
}
