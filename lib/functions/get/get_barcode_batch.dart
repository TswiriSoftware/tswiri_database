part of tswiri_database;

///Returns a list of all [BarcodeBatch].
List<BarcodeBatch> getBarcodeBatchsSync() {
  return _isar!.barcodeBatchs.where().findAllSync();
}

///default: null
///
///batchID: Returns a [BarcodeBatch] that matches the BatchID.
BarcodeBatch? getBarcodeBatchSync({
  int? batchID,
}) {
  if (batchID != null) {
    return _isar!.barcodeBatchs.filter().idEqualTo(batchID).findFirstSync();
  }
  return null;
}
