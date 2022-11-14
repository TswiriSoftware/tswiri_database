part of tswiri_database;

///default: Returns a list of all [CatalogedContainer].
///
///containerTypeID: Returns a list of [CatalogedContainer] matching the containerTypeID.
List<CatalogedContainer> getCatalogedContainersSync({
  int? containerTypeID,
}) {
  if (containerTypeID != null) {
    return _isar!.catalogedContainers
        .filter()
        .containerTypeIDEqualTo(containerTypeID)
        .findAllSync();
  }

  return _isar!.catalogedContainers.where().findAllSync();
}

///default: Returns null
///
///id: [CatalogedContainer] mathcing the ID.
///
///barcodeUID: [CatalogedContainer] matching the BarcodeUID.
///
///containerUID: [CatalogedContainer] matching the containerUID.
///
///containerTypeID: [CatalogedContainer] matching the containerTypeID.
CatalogedContainer? getCatalogedContainerSync({
  int? id,
  String? barcodeUID,
  String? containerUID,
  int? containerTypeID,
}) {
  if (id != null) {
    return _isar!.catalogedContainers.getSync(id);
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

List<CatalogedContainer> getCatalogedContainersNameContains({
  required String enteredKeyword,
}) {
  return _isar!.catalogedContainers
      .filter()
      .nameContains(enteredKeyword, caseSensitive: false)
      .findAllSync();
}

List<CatalogedContainer> getCatalogedContainersDescriptionContains({
  required String enteredKeyword,
}) {
  return _isar!.catalogedContainers
      .filter()
      .descriptionContains(enteredKeyword, caseSensitive: false)
      .findAllSync();
}
