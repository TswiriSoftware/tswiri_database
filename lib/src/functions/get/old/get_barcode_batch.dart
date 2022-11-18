import 'package:tswiri_database/src/collections/export.dart';

///Returns a list of all [BarcodeBatch].
List<BarcodeBatch> getBarcodeBatchsSync({
  required Isar isar,
}) {
  return isar.barcodeBatchs.where().findAllSync();
}

///default: null
///
///batchID: Returns a [BarcodeBatch] that matches the BatchID.
BarcodeBatch? getBarcodeBatchSync({
  required Isar isar,
  int? batchID,
}) {
  if (batchID != null) {
    return isar.barcodeBatchs.filter().idEqualTo(batchID).findFirstSync();
  }
  return null;
}
