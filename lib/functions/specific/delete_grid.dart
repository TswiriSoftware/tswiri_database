part of tswiri_database;

///Deletes a [CatalogedGrid] and all [CatalogedCoordinate]s.
deleteGrid({
  required Isar isar,
  required CatalogedGrid catalogedGrid,
}) {
  _isar!.writeTxnSync(() {
    _isar!.catalogedGrids.deleteSync(catalogedGrid.id);
    _isar!.catalogedCoordinates
        .filter()
        .gridUIDEqualTo(catalogedGrid.uid)
        .deleteAllSync();
  });
}
