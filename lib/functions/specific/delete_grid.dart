part of tswiri_database;

///Deletes a [CatalogedGrid] and all [CatalogedCoordinate]s.
deleteGrid({
  required CatalogedGrid catalogedGrid,
}) {
  _isar!.writeTxnSync(() {
    _isar!.catalogedGrids.deleteSync(catalogedGrid.id);
    _isar!.catalogedCoordinates
        .filter()
        .gridUIDEqualTo(catalogedGrid.id)
        .deleteAllSync();
  });
}
