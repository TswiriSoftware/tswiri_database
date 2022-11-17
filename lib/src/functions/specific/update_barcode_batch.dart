import 'package:tswiri_database/src/collections/export.dart';

///Updates a [BarcodeBatch] and all related [CatalogedBarcode]'s.
updateBarcodeBatch({
  required Isar isar,
  required BarcodeBatch barcodeBatch,
  required List<CatalogedBarcode> barcodes,
}) {
  isar.writeTxnSync(() {
    isar.barcodeBatchs.putSync(barcodeBatch);
    isar.catalogedBarcodes.putAllSync(barcodes);
  });
}
