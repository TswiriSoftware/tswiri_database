part of tswiri_database;

List<String> putNewBarcodeBatch({
  required BarcodeBatch newBarcodeBatch,
  required int numberOfBarcodes,
  required int timestamp,
  required double barcodeWidth,
  required double barcodeHeight,
}) {
  List<String> barcodeUIDs = [];
  _isar!.writeTxnSync(() {
    int batchID = _isar!.barcodeBatchs.putSync(newBarcodeBatch);

    for (var i = 1; i <= numberOfBarcodes; i++) {
      String barcodeUID = '${i}_$timestamp';
      _isar!.catalogedBarcodes.putSync(
        CatalogedBarcode()
          ..barcodeUID = barcodeUID
          ..width = barcodeWidth
          ..height = barcodeHeight
          ..batchID = batchID,
      );
      barcodeUIDs.add(barcodeUID);
    }
  });

  return barcodeUIDs;
}
