import 'package:tswiri_database/src/collections/export.dart';

///Creates [BarcodeBatch] and Creates list of linked [CatalogedBarcode]s.
List<CatalogedBarcode> createBarcodeBatch({
  required Isar isar,
  required BarcodeBatch batch,
  required List<CatalogedBarcode> catalogedBarcodes,
}) {
  List<CatalogedBarcode> newCatalogedBarcodes = [];
  isar.writeTxnSync(() {
    int batchID = isar.barcodeBatchs.putSync(batch);

    newCatalogedBarcodes = catalogedBarcodes
        .map(
          (e) => e..batchUID = isar.barcodeBatchs.getSync(batchID)!.uid,
        )
        .toList();

    isar.catalogedBarcodes.putAllSync(newCatalogedBarcodes);
  });

  return newCatalogedBarcodes;
}
