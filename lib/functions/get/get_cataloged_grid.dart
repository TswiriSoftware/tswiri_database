part of tswiri_database;

List<CatalogedGrid> getCatalogedGridsSync() {
  return _isar!.catalogedGrids.where().findAllSync();
}

CatalogedGrid? getCatalogedGridSync({
  int? id,
  // String? barcodeUID,
  // String? containerUID,
  // int? containerTypeID,
}) {
  if (id != null) {
    return _isar!.catalogedGrids.filter().idEqualTo(id).findFirstSync();
  }

  // if (barcodeUID != null) {
  //   return _isar!.catalogedGrids
  //       .filter()
  //       .barcodeUIDMatches(barcodeUID)
  //       .findFirstSync();
  // }

  // if (containerUID != null) {
  //   return _isar!.catalogedGrids
  //       .filter()
  //       .containerUIDMatches(containerUID)
  //       .findFirstSync();
  // }

  // if (containerTypeID != null) {
  //   return _isar!.catalogedGrids
  //       .filter()
  //       .containerTypeIDEqualTo(containerTypeID)
  //       .findFirstSync();
  // }

  return null;
}
