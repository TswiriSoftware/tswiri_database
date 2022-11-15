part of tswiri_database;

///default: Returns a list of all [CatalogedCoordinate].
///
///gridUID: Returns a list of [CatalogedCoordinate] matching gridUID.
///
List<CatalogedCoordinate> getCatalogedCoordinatesSync({
  int? gridUID,
}) {
  if (gridUID != null) {
    return _isar!.catalogedCoordinates
        .filter()
        .gridUIDEqualTo(gridUID)
        .findAllSync();
  }
  return _isar!.catalogedCoordinates.where().findAllSync();
}

CatalogedCoordinate? getCatalogedCoordinate({
  String? barcodeUID,
}) {
  if (barcodeUID != null) {
    return _isar!.catalogedCoordinates
        .filter()
        .barcodeUIDMatches(barcodeUID)
        .findFirstSync();
  }
  return null;
}
