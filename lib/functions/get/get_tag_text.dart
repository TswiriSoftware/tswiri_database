part of tswiri_database;

TagText? getTagText({
  int? id,
  // String? barcodeUID,
  // String? containerUID,
  // int? containerTypeID,
}) {
  if (id != null) {
    return _isar!.tagTexts.getSync(id);
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
