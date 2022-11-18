import 'package:tswiri_database/src/collections/export.dart';

///default: Returns a list of all [CatalogedContainer].
///
///containerTypeID: Returns a list of [CatalogedContainer] matching the containerTypeID.
List<CatalogedContainer> getCatalogedContainersSync({
  required Isar isar,
  required String? containerTypeUID,
}) {
  if (containerTypeUID != null) {
    return isar.catalogedContainers
        .filter()
        .containerTypeUIDMatches(containerTypeUID)
        .findAllSync();
  }

  return isar.catalogedContainers.where().findAllSync();
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
  required Isar isar,
  required String? uid,
  required String? barcodeUID,
  required String? containerUID,
  required String? containerTypeUID,
}) {
  if (uid != null) {
    return isar.catalogedContainers.filter().uidEqualTo(uid).findFirstSync();
  }

  if (barcodeUID != null) {
    return isar.catalogedContainers
        .filter()
        .barcodeUIDMatches(barcodeUID)
        .findFirstSync();
  }

  if (containerUID != null) {
    return isar.catalogedContainers
        .filter()
        .uidEqualTo(containerUID)
        .findFirstSync();
  }

  if (containerTypeUID != null) {
    return isar.catalogedContainers
        .filter()
        .containerTypeUIDEqualTo(containerTypeUID)
        .findFirstSync();
  }

  return null;
}

List<CatalogedContainer> getCatalogedContainersNameContains({
  required Isar isar,
  required String enteredKeyword,
}) {
  return isar.catalogedContainers
      .filter()
      .nameContains(enteredKeyword, caseSensitive: false)
      .findAllSync();
}

List<CatalogedContainer> getCatalogedContainersDescriptionContains({
  required Isar isar,
  required String enteredKeyword,
}) {
  return isar.catalogedContainers
      .filter()
      .descriptionContains(enteredKeyword, caseSensitive: false)
      .findAllSync();
}
