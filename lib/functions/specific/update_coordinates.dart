part of tswiri_database;

///Updates/Creates [CatalogedCoordinate]'s.
updateCoordinates({
  required Isar isar,
  required String gridUID,
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
