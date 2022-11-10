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
  int? id,
}) {
  if (id != null) {
    return _isar!.catalogedGrids.filter().idEqualTo(id).findFirstSync();
  }

  return null;
}
