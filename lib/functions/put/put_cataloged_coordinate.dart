part of tswiri_database;

int? putCatalogedCoordiante(
    {required CatalogedCoordinate catalogedCoordinate}) {
  int? id;
  _isar!.writeTxnSync(() {
    id = _isar!.catalogedCoordinates.putSync(catalogedCoordinate);
  });
  return id;
}
