part of tswiri_database;

createNewGrid({
  required CatalogedGrid catalogedGrid,
  required CatalogedCoordinate catalogedCoordinate,
}) {
  _isar!.writeTxnSync(() {
    int gridUID = _isar!.catalogedGrids.putSync(catalogedGrid);
    _isar!.catalogedCoordinates.putSync(catalogedCoordinate..gridUID = gridUID);
  });
}
