part of tswiri_database;

///default: Returns a list of all [CatalogedGrid].
List<CatalogedGrid> getCatalogedGridsSync() {
  return _isar!.catalogedGrids.where().findAllSync();
}

///default: Returns null.
///
///id: Returns a [CatalogedGrid] matching id.
///
CatalogedGrid? getCatalogedGridSync({
  int? gridUID,
}) {
  if (gridUID != null) {
    return _isar!.catalogedGrids.getSync(gridUID);
  }

  return null;
}
