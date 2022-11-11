part of tswiri_database;

putCoordinates({
  required int gridUID,
  required List<CatalogedCoordinate> coordinates,
}) {
  _isar!.writeTxnSync(() {
    //1. detele IT if IT exists.
    _isar!.catalogedCoordinates
        .filter()
        .gridUIDEqualTo(gridUID)
        .deleteAllSync();
    for (var coordinate in coordinates) {
      //2. input IT.
      _isar!.catalogedCoordinates.putSync(coordinate);
    }
  });
}
