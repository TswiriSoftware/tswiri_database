part of tswiri_database;

///Creates a new [BarcodeBatch].
List<CatalogedBarcode> createBarcodeBatch({
  required BarcodeBatch batch,

  ///TODO:  Add list of catalogedBarcodes
  required int amount, //Remove
  required int timestamp, //Remove
}) {
  List<CatalogedBarcode> newCatalogedBarcodes = [];
  _isar!.writeTxnSync(() {
    int batchID = _isar!.barcodeBatchs.putSync(batch);

    for (var i = 1; i <= amount; i++) {
      String barcodeUID = '${i}_$timestamp';
      newCatalogedBarcodes.add(
        CatalogedBarcode()
          ..barcodeUID = barcodeUID
          ..width = batch.width
          ..height = batch.height
          ..batchID = batchID,
      );
    }

    _isar!.catalogedBarcodes.putAllSync(newCatalogedBarcodes);

    ///TODO: write to changes.
  });

  return newCatalogedBarcodes;
}

// excecuteBarcodeBatchChange(Change change) {
//   //Decode and excecute.
// }
