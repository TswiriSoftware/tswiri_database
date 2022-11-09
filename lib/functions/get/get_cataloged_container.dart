part of tswiri_database;

///Returns a list of all cataloged barcodes. (sync)
/// Optional.
/// - Container Type ID.
///
List<CatalogedContainer> getCatalogedContainers({
  int? containerTypeID,
}) {
  return _isar!.catalogedContainers.where().findAllSync();
}

CatalogedContainer? getCatalogedContainer({
  int? id,
  String? barcodeUID,
  String? containerUID,
  int? containerTypeID,
}) {
  if (id != null) {
    return _isar!.catalogedContainers.filter().idEqualTo(id).findFirstSync();
  }

  if (barcodeUID != null) {
    return _isar!.catalogedContainers
        .filter()
        .barcodeUIDMatches(barcodeUID)
        .findFirstSync();
  }

  if (containerUID != null) {
    return _isar!.catalogedContainers
        .filter()
        .containerUIDMatches(containerUID)
        .findFirstSync();
  }

  if (containerTypeID != null) {
    return _isar!.catalogedContainers
        .filter()
        .containerTypeIDEqualTo(containerTypeID)
        .findFirstSync();
  }

  return null;
}
