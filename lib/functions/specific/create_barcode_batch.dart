part of tswiri_database;

///Creates [BarcodeBatch] and Creates list of linked [CatalogedBarcode]s.
List<CatalogedBarcode> createBarcodeBatch({
  required BarcodeBatch batch,
  required List<CatalogedBarcode> catalogedBarcodes,
}) {
  List<CatalogedBarcode> newCatalogedBarcodes = [];
  _isar!.writeTxnSync(() {
    int batchID = _isar!.barcodeBatchs.putSync(batch);

    newCatalogedBarcodes =
        catalogedBarcodes.map((e) => e..batchID = batchID).toList();

    _isar!.catalogedBarcodes.putAllSync(newCatalogedBarcodes);
  });

  return newCatalogedBarcodes;
}
