part of tswiri_database;

///Updates/Creates a grid's [CatalogedCoordinate].
updateCoordinates({
  required int gridUID,
  required List<CatalogedCoordinate> coordinates,
}) {
  _isar!.writeTxnSync(() {
    _isar!.catalogedCoordinates
        .filter()
        .gridUIDEqualTo(gridUID)
        .deleteAllSync();

    _isar!.catalogedCoordinates.putAllSync(coordinates);
  });
}
