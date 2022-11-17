import 'package:tswiri_database/src/collections/export.dart';

//Delete a barcodeBatch Identified by ID.
// - This deletes not only the Barcode Batch but ALSO all related CatalogedBarcodes.
deleteBarcodeBatch({
  required Isar isar,
  required String uid,
}) {
  isar.writeTxnSync(() {
    isar.barcodeBatchs.filter().uidEqualTo(uid).deleteFirstSync();
    isar.catalogedBarcodes.filter().batchUIDEqualTo(uid).deleteAllSync();
  });
}
