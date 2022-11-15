part of tswiri_database;

deleteGrid({
  required int gridUID,
}) {
  _isar!.writeTxnSync(() {
    _isar!.catalogedGrids.deleteSync(gridUID);
    _isar!.catalogedCoordinates
        .filter()
        .gridUIDEqualTo(gridUID)
        .deleteAllSync();
  });
}
