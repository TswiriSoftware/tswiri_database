part of tswiri_database;

///Used to update a barcode batch's Width and Height.
putBarcodeBatch({
  required BarcodeBatch batch,
  required double width,
  required double height,
}) {
  _isar!.writeTxnSync(
    () => _isar!.barcodeBatchs.putSync(batch),
  );

  List<CatalogedBarcode> relatedBarcodes =
      _isar!.catalogedBarcodes.filter().batchIDEqualTo(batch.id).findAllSync();

  _isar!.writeTxnSync(() {
    for (CatalogedBarcode barcode in relatedBarcodes) {
      barcode.width = width;
      _isar!.catalogedBarcodes.putSync(barcode);
    }
  });
}
